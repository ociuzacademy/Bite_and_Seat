// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/booking_module/typedefs/format_time.dart';
import 'package:bite_and_seat/modules/booking_module/typedefs/select_time_slot.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';

class TimeSlotSelectionWidget extends StatelessWidget {
  final List<TimeSlotModel> timeSlots;
  final TimeSlotModel? selectedTimeSlot;
  final SelectTimeSlot onSelectingTimeSlot;
  final FormatTime formatTimeOfDay;
  const TimeSlotSelectionWidget({
    super.key,
    required this.timeSlots,
    this.selectedTimeSlot,
    required this.onSelectingTimeSlot,
    required this.formatTimeOfDay,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a time slot for your booking:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
          ),
          itemCount: timeSlots.length,
          itemBuilder: (context, index) {
            final slot = timeSlots[index];
            final isSelected = selectedTimeSlot == slot;

            return GestureDetector(
              onTap: () {
                onSelectingTimeSlot(slot);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppPalette.firstColor : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppPalette.firstColor
                        : (Colors.grey[300] ?? Colors.grey),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    '${formatTimeOfDay(slot.startTime)} - ${formatTimeOfDay(slot.endTime)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        if (selectedTimeSlot != null) ...[
          const SizedBox(height: 16),
          Text(
            'Selected: ${formatTimeOfDay(selectedTimeSlot!.startTime)} - ${formatTimeOfDay(selectedTimeSlot!.endTime)}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPalette.firstColor,
            ),
          ),
        ],
      ],
    );
  }
}
