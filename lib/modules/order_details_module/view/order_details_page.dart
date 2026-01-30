// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';
import 'package:bite_and_seat/modules/order_details_module/utils/order_details_helper.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/order_details_row.dart';
import 'package:bite_and_seat/modules/orders_module/model/order_model.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:bite_and_seat/widgets/custom_error_widget.dart';
import 'package:bite_and_seat/widgets/loaders/custom_loading_widget.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  const OrderDetailsPage({super.key, required this.orderId});

  static MaterialPageRoute route({required int orderId}) => MaterialPageRoute(
    builder: (context) => OrderDetailsPage(orderId: orderId),
  );

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderDetailsHelper _orderDetailsHelper;

  @override
  void initState() {
    super.initState();
    _orderDetailsHelper = OrderDetailsHelper(
      context: context,
      orderId: widget.orderId,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _orderDetailsHelper.orderDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: const IconThemeData(color: AppPalette.secondColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.secondColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SubmitFeedbackBloc, SubmitFeedbackState>(
            listener: (context, state) {
              switch (state) {
                case SubmitFeedbackLoading _:
                  OverlayLoader.show(
                    context,
                    message: 'Submitting feedback...',
                  );
                  break;
                case SubmitFeedbackError(:final errorMessage):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context, message: errorMessage);
                  break;
                case SubmitFeedbackSuccess(:final response):
                  OverlayLoader.hide();
                  CustomSnackbar.showSuccess(
                    context,
                    message: response.message,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MenuPage.route(),
                    (_) => false,
                  );
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
          BlocListener<CancelOrderBloc, CancelOrderState>(
            listener: (context, state) {
              switch (state) {
                case CancelOrderLoading _:
                  OverlayLoader.show(context, message: 'Canceling order...');
                  break;
                case CancelOrderError(:final message):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context, message: message);
                  break;
                case CancelOrderSuccess(:final response):
                  OverlayLoader.hide();
                  CustomSnackbar.showSuccess(
                    context,
                    message: response.message,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MenuPage.route(),
                    (_) => false,
                  );
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
        ],
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            switch (state) {
              case OrderLoading _:
                return const CustomLoadingWidget(
                  message: 'Loading order details...',
                );
              case OrderError(:final errorMessage):
                return CustomErrorWidget(
                  onRetry: _orderDetailsHelper.orderDetailsInit,
                  errorMessage: errorMessage,
                );
              case OrderDetailsSuccess(:final orderDetails):
                final OrderStatus status = orderDetails.isCompleted
                    ? OrderStatus.completed
                    : OrderStatus.upcoming;
                final FoodTime foodTime = OrderDetailsHelper.getFoodTime(
                  orderDetails.category,
                );

                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                final bookingDate = DateTime(
                  orderDetails.date.year,
                  orderDetails.date.month,
                  orderDetails.date.day,
                );

                final canCancel =
                    !orderDetails.isCompleted &&
                    (bookingDate.isAtSameMomentAs(today) ||
                        bookingDate.isAfter(today));
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order Summary Card
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Order ID and Status
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order #//${orderDetails.id}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppPalette.firstColor.withValues(
                                        alpha: 0.2,
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Text(
                                      status == OrderStatus.completed
                                          ? 'Completed'
                                          : 'Upcoming',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppPalette.firstColor,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Date and Time
                              OrderDetailsRow(
                                icon: Icons.calendar_today,
                                label: 'Date & Time',
                                value:
                                    '${OrderDetailsHelper.formatDate(orderDetails.date)}${orderDetails.slotStartTime != null ? ' • ${orderDetails.slotStartTime} - ${orderDetails.slotEndTime}' : ''}',
                              ),
                              const SizedBox(height: 12),

                              // Food Time
                              OrderDetailsRow(
                                icon: Icons.restaurant,
                                label: 'Meal Type',
                                value: OrderDetailsHelper.formatFoodTime(
                                  foodTime,
                                ),
                              ),
                              const SizedBox(height: 12),

                              // Number of Persons
                              OrderDetailsRow(
                                icon: Icons.people,
                                label: 'Number of Persons',
                                value: (orderDetails.numberOfPersons ?? 0)
                                    .toString(),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Food Items Section
                      Text(
                        'Food Items',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),

                      // Food Items List
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ...orderDetails.items.map((item) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        item.foodItemName,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '${item.quantity} x \u{20B9}${item.price}',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '\u{20B9}${item.totalPrice}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),

                            // Divider
                            if (orderDetails.items.isNotEmpty)
                              const Divider(height: 1),

                            // Seat Booking Amount
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Seat Booking Amount',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '${orderDetails.numberOfPersons ?? 0} x \u{20B9}5.00',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      '\u{20B9}${((orderDetails.numberOfPersons ?? 0) * 5.0).toStringAsFixed(2)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Divider
                            const Divider(height: 1),

                            // Total Amount
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '\u{20B9}${orderDetails.totalAmount}',
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppPalette.firstColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Cancel Order Button
                      if (canCancel) ...[
                        CustomButton(
                          buttonWidth: double.infinity,
                          backgroundColor: Colors.white,
                          textColor: AppPalette.errorColor,
                          labelText: 'Cancel Order',
                          onClick: _orderDetailsHelper.showCancelOrderDialog,
                        ),
                        const SizedBox(height: 12),
                      ],

                      // Review Button
                      CustomButton(
                        buttonWidth: double.infinity,
                        backgroundColor: AppPalette.firstColor,
                        textColor: AppPalette.secondColor,
                        labelText: status == OrderStatus.completed
                            ? 'Submit Review'
                            : 'Check In',
                        onClick: () {
                          status == OrderStatus.completed
                              ? _orderDetailsHelper.showReviewDialog(
                                  orderDetails.id,
                                  orderDetails.items,
                                )
                              : _orderDetailsHelper.checkIn();
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
