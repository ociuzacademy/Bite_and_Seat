import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeUtils {
  /// Convert "HH:mm:ss" string to TimeOfDay
  static TimeOfDay stringToTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
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
