import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';

class TimeUtils {
  /// Convert "HH:mm:ss" string to TimeOfDay
  static TimeOfDay stringToTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  /// Convert "HH:mm:ss" string to TimeOfDay considering `FoodTime`.
  ///
  /// Some backends return hour values in 12-hour format without AM/PM.
  /// Use `foodTime` context to disambiguate (treat lunch/dinner as PM).
  static TimeOfDay stringToTimeOfDayWithFoodTime(
    String time,
    FoodTime foodTime,
  ) {
    final parts = time.split(':');
    var hour = int.parse(parts[0]);
    final minute = int.parse(parts[1]);

    // If backend provides 12-hour-like hours without AM/PM and the meal is
    // lunch or dinner, treat hours 1-11 as PM (add 12). Keep 12 as-is.
    if (foodTime == FoodTime.lunch || foodTime == FoodTime.eveningSnacks) {
      if (hour >= 1 && hour <= 11) {
        hour = (hour + 12) % 24;
      }
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  /// Convert TimeOfDay to "HH:mm:ss"
  static String timeOfDayToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute:00';
  }

  /// Convert TimeOfDay to formatted 12-hour UI string (ex: 04:30 PM)
  static String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    return DateFormat.jm().format(dt); // 4:30 PM
  }
}
