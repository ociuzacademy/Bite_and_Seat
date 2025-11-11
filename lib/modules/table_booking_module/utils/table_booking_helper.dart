// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/table_booking_module/providers/table_booking_provider.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class TableBookingHelper {
  final int orderId;
  final BuildContext context;
  const TableBookingHelper({required this.orderId, required this.context});

  void orderDetailsInit() {
    final OrderCubit orderCubit = context.read<OrderCubit>();
    orderCubit.getOrderDetails(orderId);
  }

  void tableSeatsListInit(DateTime orderDate, int slotId) {
    final TableSeatsListCubit tableSeatsListCubit = context
        .read<TableSeatsListCubit>();
    tableSeatsListCubit.getAllTableSeatsList(orderDate, slotId);
  }

  void submitBookingStep3() {
    final provider = Provider.of<TableBookingProvider>(context, listen: false);

    if (!provider.canProceedToPayment) {
      CustomSnackbar.showError(
        context,
        message: 'Please select exactly ${provider.numberOfPeople} chairs',
      );
      return;
    }
    final BookingBloc bookingBloc = context.read<BookingBloc>();
    bookingBloc.add(
      BookingEvent.step3BookingStarted(orderId, provider.selectedTablesModel),
    );
  }
}
