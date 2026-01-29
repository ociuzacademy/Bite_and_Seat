// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/core/models/api_models/order_details_model.dart';
import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/review_dialog.dart';
import 'package:bite_and_seat/modules/qr_code_module/view/q_r_code_page.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final int orderId;
  OrderDetailsHelper({required this.context, required this.orderId});

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

  static FoodTime getFoodTime(int categoryId) {
    switch (categoryId) {
      case 1:
        return FoodTime.breakfast;
      case 2:
        return FoodTime.lunch;
      default:
        return FoodTime.eveningSnacks;
    }
  }

  static String formatFoodTime(FoodTime foodTime) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return 'Breakfast';
      case FoodTime.lunch:
        return 'Lunch';
      case FoodTime.eveningSnacks:
        return 'Evening Snacks';
    }
  }

  void showReviewDialog(int orderId, List<Item> foodItems) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReviewDialog(orderId: orderId, foodItems: foodItems);
      },
    );
  }

  void orderDetailsInit() {
    final OrderCubit orderCubit = context.read<OrderCubit>();
    orderCubit.getOrderDetails(orderId);
  }

  void checkIn() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Check In'),
        content: const Column(
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
                MaterialPageRoute(builder: (_) => QRCodePage(orderId: orderId)),
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

  void showCancelOrderDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Order'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Are you sure you want to cancel this order?')],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close bottom sheet
              _cancelOrder();
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

  void _cancelOrder() {
    final CancelOrderBloc cancelOrderBloc = context.read<CancelOrderBloc>();
    cancelOrderBloc.add(CancelOrderEvent.cancelOrder(orderId: orderId));
  }
}
