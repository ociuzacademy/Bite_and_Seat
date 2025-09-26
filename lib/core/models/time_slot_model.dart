// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TimeSlotModel {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String slotId;

  const TimeSlotModel({
    required this.startTime,
    required this.endTime,
    required this.slotId,
  });
}
