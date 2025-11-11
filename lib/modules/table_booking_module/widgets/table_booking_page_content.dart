// ignore_for_file: public_member_api_docs, sort_constructors_first
// table_booking_page_content.dart

import 'package:bite_and_seat/modules/payment_module/view/payment_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/providers/table_booking_provider.dart';
import 'package:bite_and_seat/modules/table_booking_module/utils/table_booking_helper.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/status_indicator.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_widget.dart';
import 'package:bite_and_seat/widgets/custom_error_widget.dart';
import 'package:bite_and_seat/widgets/loaders/custom_loading_widget.dart';

class TableBookingPageContent extends StatefulWidget {
  final int orderId;
  final int slotId;
  const TableBookingPageContent({
    super.key,
    required this.orderId,
    required this.slotId,
  });

  @override
  State<TableBookingPageContent> createState() =>
      _TableBookingPageContentState();
}

class _TableBookingPageContentState extends State<TableBookingPageContent> {
  late TableBookingHelper _tableBookingHelper;
  @override
  void initState() {
    super.initState();
    _tableBookingHelper = TableBookingHelper(
      orderId: widget.orderId,
      context: context,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _tableBookingHelper.orderDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TableBookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Chairs'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: const IconThemeData(color: AppPalette.whiteColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<OrderCubit, OrderState>(
            listener: (context, state) {
              switch (state) {
                case OrderDetailsSuccess(:final orderDetails):
                  final TableBookingProvider provider = Provider.of(
                    context,
                    listen: false,
                  );
                  provider.numberOfPeople = orderDetails.numberOfPersons;
                  provider.totalRate = double.tryParse(
                    orderDetails.totalAmount,
                  );
                  _tableBookingHelper.tableSeatsListInit(
                    orderDetails.date,
                    widget.slotId,
                  );
                  break;
                default:
              }
            },
          ),
          BlocListener<TableSeatsListCubit, TableSeatsListState>(
            listener: (context, state) {
              switch (state) {
                case TableSeatsListSuccess(:final tableSeatsList):
                  final List<TableModel> tables = tableSeatsList.data
                      .map(
                        (table) => TableModel(
                          tableId: table.id,
                          tableName: table.tableName,
                          numberOfSeats: table.numberOfSeats,
                          bookingPrice: table.numberOfSeats * 5,
                          chairs: table.seats
                              .map(
                                (seat) => ChairModel(
                                  chairId: seat.id,
                                  status: seat.isBooked
                                      ? ChairStatus.occupied
                                      : ChairStatus.available,
                                  position: seat.seatNumber,
                                ),
                              )
                              .toList(),
                        ),
                      )
                      .toList();
                  provider.initializeTables(tables);
                  break;
                default:
              }
            },
          ),
          BlocListener<BookingBloc, BookingState>(
            listener: (context, state) {
              switch (state) {
                case BookingInitial _:
                case BookingLoading _:
                  OverlayLoader.show(
                    context,
                    message: 'Booking tables and chairs...',
                  );
                  break;
                case BookingError(:final errorMessage):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context, message: errorMessage);
                  break;
                case Step3Completed(:final response):
                  OverlayLoader.hide();
                  CustomSnackbar.showSuccess(
                    context,
                    message: response.message,
                  );
                  Navigator.push(
                    context,
                    PaymentPage.route(
                      orderId: widget.orderId,
                      totalRate: double.parse(response.order.totalAmount),
                    ),
                  );
                  break;
                default:
              }
            },
            child: Container(),
          ),
        ],
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            switch (state) {
              case OrderInitial _:
              case OrderLoading _:
                return const CustomLoadingWidget.centered(
                  message: 'fetching order details...',
                );
              case OrderError(:final errorMessage):
                return CustomErrorWidget(
                  onRetry: _tableBookingHelper.orderDetailsInit,
                  errorMessage: errorMessage,
                );
              case OrderDetailsSuccess(:final orderDetails):
                // Show loading if data is not yet set
                if (provider.numberOfPeople == null ||
                    provider.totalRate == null) {
                  return const CustomLoadingWidget.centered(
                    message: 'Loading table data...',
                  );
                }

                return BlocBuilder<TableSeatsListCubit, TableSeatsListState>(
                  builder: (context, state) {
                    switch (state) {
                      case TableSeatsListInitial _:
                      case TableSeatsListLoading _:
                        return const CustomLoadingWidget.centered(
                          message: 'fetching tables and seats list...',
                        );
                      case TableSeatsListError(:final errorMessage):
                        return CustomErrorWidget(
                          onRetry: () => _tableBookingHelper.tableSeatsListInit(
                            orderDetails.date,
                            widget.slotId,
                          ),
                          errorMessage: errorMessage,
                        );
                      case TableSeatsListSuccess _:
                        return Column(
                          children: [
                            // Selection info
                            Container(
                              padding: const EdgeInsets.all(16),
                              color: Colors.blue.shade50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Selected: ${provider.selectedChairCount}/${provider.numberOfPeople} chairs',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      if (provider.selectedTables.isNotEmpty)
                                        Text(
                                          'Tables: ${provider.selectedTables.map((t) => t.tableId).join(', ')}',
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                    ],
                                  ),
                                  if (provider.selectedChairCount > 0)
                                    TextButton(
                                      onPressed: provider.clearSelection,
                                      child: const Text('Clear Selection'),
                                    ),
                                ],
                              ),
                            ),

                            // Status indicators
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  StatusIndicator(
                                    text: 'Available',
                                    color: Colors.green,
                                  ),
                                  StatusIndicator(
                                    text: 'Selected',
                                    color: Colors.blue,
                                  ),
                                  StatusIndicator(
                                    text: 'Occupied',
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 8),

                            // All tables with available chairs
                            Expanded(
                              child: provider.availableTables.isEmpty
                                  ? const Center(
                                      child: Text(
                                        'No available chairs',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  : GridView.builder(
                                      padding: const EdgeInsets.all(16),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 12,
                                            childAspectRatio: 0.85,
                                          ),
                                      itemCount:
                                          provider.availableTables.length,
                                      itemBuilder: (context, index) {
                                        final table =
                                            provider.availableTables[index];
                                        return TableWidget(
                                          table: table,
                                          onSelectChair: (table, chair) {
                                            provider.toggleChairSelection(
                                              table,
                                              chair,
                                            );
                                          },
                                        );
                                      },
                                    ),
                            ),

                            // Proceed to payment button
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: provider.canProceedToPayment
                                      ? _tableBookingHelper.submitBookingStep3
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        provider.canProceedToPayment
                                        ? AppPalette.firstColor
                                        : Colors.grey,
                                    foregroundColor: AppPalette.whiteColor,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    provider.canProceedToPayment
                                        ? 'Proceed to Payment - \u{20B9}${provider.totalBookingPrice.toStringAsFixed(2)}'
                                        : 'Select ${provider.numberOfPeople} Chairs',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                    }
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
