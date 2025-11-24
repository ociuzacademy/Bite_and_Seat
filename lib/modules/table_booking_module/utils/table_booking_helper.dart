// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/selected_tables_model.dart';

class TableBookingHelper {
  final int orderId;
  final BuildContext context;
  const TableBookingHelper({required this.orderId, required this.context});

  void orderDetailsInit() {
    final OrderCubit orderCubit = context.read<OrderCubit>();
    orderCubit.getOrderDetails(orderId);
  }

  void tableSeatsListInit(DateTime orderDate, int categoryDate, int slotId) {
    final TableSeatsListCubit tableSeatsListCubit = context
        .read<TableSeatsListCubit>();
    tableSeatsListCubit.getAllTableSeatsList(orderDate, categoryDate, slotId);
  }

  void submitBookingStep3(SelectedTablesModel selectedTablesModel) {
    final TableSeatsBookingBloc tableSeatsBookingBloc = context
        .read<TableSeatsBookingBloc>();
    tableSeatsBookingBloc.add(
      TableSeatsBookingEvent.bookingTableSeats(orderId, selectedTablesModel),
    );
  }
}
