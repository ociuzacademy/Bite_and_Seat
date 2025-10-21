// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/review_dialog.dart';
import 'package:bite_and_seat/modules/orders_module/model/order_model.dart';
import 'package:bite_and_seat/modules/qr_code_module/view/q_r_code_page.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final OrderModel order;
  OrderDetailsHelper({required this.context, required this.order});

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

  String formatFoodTime(FoodTime foodTime) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return 'Breakfast';
      case FoodTime.lunch:
        return 'Lunch';
      case FoodTime.eveningSnacks:
        return 'Evening Snacks';
    }
  }

  void showReviewDialog(String orderId, List<CartItemModel> foodItems) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReviewDialog(orderId: orderId, foodItems: foodItems);
      },
    );
  }

  void checkIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Check In'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Are you going to check in?')],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close bottom sheet
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => QRCodePage(
                    selectedDate: order.date,
                    selectedTimeSlot: order.timeSlot,
                    numberOfPersons: order.numberOfPersons,
                    selectedRoomId: order.roomId,
                    selectedTableId: order.tableId,
                    totalRate: order.rate,
                  ),
                ),
                (route) => false,
              );
            },
            child: const Text(
              'Confirm',
              style: TextStyle(color: AppPalette.firstColor),
            ),
          ),
        ],
      ),
    );
  }
}
