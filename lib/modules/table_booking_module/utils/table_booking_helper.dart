// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/table_booking_module/cubit/table_seats_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
