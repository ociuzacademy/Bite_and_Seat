// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/providers/booking_state_provider.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/cart_items_list_widget.dart';
import 'package:bite_and_seat/modules/table_booking_module/view/table_booking_page.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class BookingHelper {
  final BuildContext context;
  final List<CartItemModel> cartItems;
  final BookingStateProvider bookingStateProvider;
  final DateTime selectedDate;

  BookingHelper({
    required this.context,
    required this.cartItems,
    required this.bookingStateProvider,
    required this.selectedDate,
  });

  void openCart(List<CartItemModel> cartItems) {
    // Open a bottom sheet with fixed height (60% of screen)
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height:
              MediaQuery.of(context).size.height * 0.6, // 60% of screen height
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: CartItemsListWidget(cartItems: cartItems),
        );
      },
    );
  }

  void submitBooking() {
    // Handle booking submission
    if (bookingStateProvider.selectedTimeSlot == null) {
      CustomSnackbar.showError(context, message: 'Please select a time slot');
      bookingStateProvider.setCurrentStep(0); // Go back to time slot selection
      return;
    }

    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Booking'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${formatDate(selectedDate)}'),
            Text(
              'Time: ${formatTimeOfDay(bookingStateProvider.selectedTimeSlot!.startTime)} - ${formatTimeOfDay(bookingStateProvider.selectedTimeSlot!.endTime)}',
            ),
            Text('Number of persons: ${bookingStateProvider.numberOfPersons}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              final totalRate = cartItems.fold(
                0.0,
                (previousValue, element) => previousValue + element.rate,
              );

              Navigator.push(
                context,
                TableBookingPage.route(
                  selectedDate: selectedDate,
                  selectedTimeSlot: bookingStateProvider.selectedTimeSlot!,
                  numberOfPeople: bookingStateProvider.numberOfPersons,
                  totalRate: totalRate + 10,
                ),
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

  // Helper methods
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String getDayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  String formatDate(DateTime date) {
    return '${getDayName(date.weekday)}, ${date.day} ${getMonthName(date.month)} ${date.year}';
  }

  List<TimeSlotModel> getTimeSlots(FoodTime foodTime) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return AppConstants.morningSlots;
      case FoodTime.lunch:
        return AppConstants.afternoonSlots;
      case FoodTime.eveningSnacks:
        return AppConstants.eveningSlots;
    }
  }
}
