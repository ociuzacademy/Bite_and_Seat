// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/utils/order_details_helper.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/order_details_row.dart';
import 'package:bite_and_seat/modules/orders_module/model/order_model.dart';

class OrderDetailsPage extends StatefulWidget {
  final OrderModel order;
  const OrderDetailsPage({super.key, required this.order});

  static MaterialPageRoute route({required OrderModel order}) =>
      MaterialPageRoute(builder: (context) => OrderDetailsPage(order: order));

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
      order: widget.order,
    );
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
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
      body: SingleChildScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order #${order.orderId}',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppPalette.firstColor.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            order.status == OrderStatus.completed
                                ? 'Completed'
                                : 'Upcoming',
                            style: Theme.of(context).textTheme.bodySmall
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
                          '${_orderDetailsHelper.formatDate(order.date)} • ${_orderDetailsHelper.formatTimeSlot(order.timeSlot)}',
                    ),
                    const SizedBox(height: 12),

                    // Food Time
                    OrderDetailsRow(
                      icon: Icons.restaurant,
                      label: 'Meal Type',
                      value: _orderDetailsHelper.formatFoodTime(order.foodTime),
                    ),
                    const SizedBox(height: 12),

                    // Number of Persons
                    OrderDetailsRow(
                      icon: Icons.people,
                      label: 'Number of Persons',
                      value: order.numberOfPersons.toString(),
                    ),
                    const SizedBox(height: 12),

                    // Room and Table
                    Row(
                      children: [
                        Expanded(
                          child: OrderDetailsRow(
                            icon: Icons.meeting_room,
                            label: 'Room',
                            value: order.roomId,
                          ),
                        ),
                        Expanded(
                          child: OrderDetailsRow(
                            icon: Icons.table_restaurant,
                            label: 'Table',
                            value: order.tableId,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Food Items Section
            Text(
              'Food Items',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
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
                  ...order.cartItems.map((item) {
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
                              item.name,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${item.count} x \u{20B9}${item.ratePerItem.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '\u{20B9}${item.rate.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  // Divider
                  const Divider(height: 1),

                  // Total Amount
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\u{20B9}${order.rate.toStringAsFixed(2)}',
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

            // Review Button
            CustomButton(
              buttonWidth: double.infinity,
              backgroundColor: AppPalette.firstColor,
              textColor: AppPalette.secondColor,
              labelText: order.status == OrderStatus.completed
                  ? 'Submit Review'
                  : 'Check In',
              onClick: () {
                order.status == OrderStatus.completed
                    ? _orderDetailsHelper.showReviewDialog(
                        order.orderId,
                        order.cartItems,
                      )
                    : _orderDetailsHelper.checkIn();
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
