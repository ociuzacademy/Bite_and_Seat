// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';

class OrdersHelper {
  final BuildContext context;
  OrdersHelper({required this.context});

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String formatTimeSlot(TimeSlotModel timeSlot) {
    String formatTimeOfDay(TimeOfDay time) {
      final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
      final minute = time.minute.toString().padLeft(2, '0');
      final period = time.period == DayPeriod.am ? 'AM' : 'PM';
      return '$hour:$minute $period';
    }

    return '${formatTimeOfDay(timeSlot.startTime)} - ${formatTimeOfDay(timeSlot.endTime)}';
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
