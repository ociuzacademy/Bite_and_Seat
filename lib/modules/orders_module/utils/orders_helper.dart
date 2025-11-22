// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/orders_module/cubit/user_orders_cubit.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersHelper {
  final BuildContext context;
  const OrdersHelper({required this.context});

  static String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  static String formatTimeSlot(TimeSlotModel timeSlot) {
    String formatTimeOfDay(TimeOfDay time) {
      final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      final minute = time.minute.toString().padLeft(2, '0');
      final period = time.period == DayPeriod.am ? 'AM' : 'PM';
      return '$hour:$minute $period';
    }

    return '${formatTimeOfDay(timeSlot.startTime)} - ${formatTimeOfDay(timeSlot.endTime)}';
  }

  void userOrdersListInit() {
    final UserOrdersCubit userOrdersCubit = context.read<UserOrdersCubit>();
    userOrdersCubit.getUserOrders();
  }

  void showCancelDialog(String orderId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cancel Reservation'),
          content: Text(
            'Are you sure you want to cancel reservation $orderId?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement cancel reservation functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Reservation $orderId cancelled'),
                    backgroundColor: AppPalette.firstColor,
                  ),
                );
              },
              child: const Text(
                'Yes, Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
