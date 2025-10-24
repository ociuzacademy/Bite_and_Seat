import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const List<TimeSlotModel> morningSlots = [
    TimeSlotModel(
      slotId: "01",
      startTime: TimeOfDay(hour: 8, minute: 30),
      endTime: TimeOfDay(hour: 8, minute: 59),
    ),
    TimeSlotModel(
      slotId: "02",
      startTime: TimeOfDay(hour: 9, minute: 0),
      endTime: TimeOfDay(hour: 9, minute: 29),
    ),
    TimeSlotModel(
      slotId: "03",
      startTime: TimeOfDay(hour: 9, minute: 30),
      endTime: TimeOfDay(hour: 9, minute: 59),
    ),
    TimeSlotModel(
      slotId: "04",
      startTime: TimeOfDay(hour: 10, minute: 0),
      endTime: TimeOfDay(hour: 10, minute: 29),
    ),
    TimeSlotModel(
      slotId: "05",
      startTime: TimeOfDay(hour: 10, minute: 30),
      endTime: TimeOfDay(hour: 10, minute: 59),
    ),
    TimeSlotModel(
      slotId: "06",
      startTime: TimeOfDay(hour: 11, minute: 0),
      endTime: TimeOfDay(hour: 11, minute: 29),
    ),
    TimeSlotModel(
      slotId: "07",
      startTime: TimeOfDay(hour: 11, minute: 30),
      endTime: TimeOfDay(hour: 11, minute: 59),
    ),
  ];
  static const List<TimeSlotModel> afternoonSlots = [
    TimeSlotModel(
      slotId: "08",
      startTime: TimeOfDay(hour: 12, minute: 0),
      endTime: TimeOfDay(hour: 12, minute: 29),
    ),
    TimeSlotModel(
      slotId: "09",
      startTime: TimeOfDay(hour: 12, minute: 30),
      endTime: TimeOfDay(hour: 12, minute: 59),
    ),
    TimeSlotModel(
      slotId: "10",
      startTime: TimeOfDay(hour: 13, minute: 0),
      endTime: TimeOfDay(hour: 13, minute: 29),
    ),
    TimeSlotModel(
      slotId: "11",
      startTime: TimeOfDay(hour: 13, minute: 30),
      endTime: TimeOfDay(hour: 13, minute: 59),
    ),
    TimeSlotModel(
      slotId: "12",
      startTime: TimeOfDay(hour: 14, minute: 0),
      endTime: TimeOfDay(hour: 14, minute: 29),
    ),
    TimeSlotModel(
      slotId: "13",
      startTime: TimeOfDay(hour: 14, minute: 30),
      endTime: TimeOfDay(hour: 14, minute: 59),
    ),
    TimeSlotModel(
      slotId: "14",
      startTime: TimeOfDay(hour: 15, minute: 0),
      endTime: TimeOfDay(hour: 15, minute: 29),
    ),
  ];
  static const List<TimeSlotModel> eveningSlots = [
    TimeSlotModel(
      slotId: "15",
      startTime: TimeOfDay(hour: 15, minute: 30),
      endTime: TimeOfDay(hour: 15, minute: 59),
    ),
    TimeSlotModel(
      slotId: "16",
      startTime: TimeOfDay(hour: 16, minute: 0),
      endTime: TimeOfDay(hour: 16, minute: 29),
    ),
    TimeSlotModel(
      slotId: "17",
      startTime: TimeOfDay(hour: 16, minute: 30),
      endTime: TimeOfDay(hour: 16, minute: 59),
    ),
    TimeSlotModel(
      slotId: "18",
      startTime: TimeOfDay(hour: 17, minute: 0),
      endTime: TimeOfDay(hour: 17, minute: 29),
    ),
    TimeSlotModel(
      slotId: "19",
      startTime: TimeOfDay(hour: 17, minute: 30),
      endTime: TimeOfDay(hour: 17, minute: 59),
    ),
    TimeSlotModel(
      slotId: "20",
      startTime: TimeOfDay(hour: 18, minute: 0),
      endTime: TimeOfDay(hour: 18, minute: 29),
    ),
  ];

  static const int requestTimeoutSeconds = 30; // 30 seconds timeout
}
