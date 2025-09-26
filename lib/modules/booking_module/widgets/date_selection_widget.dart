// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/booking_module/typedefs/format_to_string.dart';
import 'package:bite_and_seat/modules/booking_module/typedefs/same_date_checker.dart';
import 'package:bite_and_seat/modules/booking_module/typedefs/select_date.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';

class DateSelectionWidget extends StatelessWidget {
  const DateSelectionWidget({
    super.key,
    required this.dateOptions,
    required this.selectedDate,
    required this.isSameDay,
    required this.onSelectingDate,
    required this.getDayName,
    required this.getMonthName,
  });

  final List<DateTime> dateOptions;
  final DateTime selectedDate;
  final SameDateChecker isSameDay;
  final SelectDate onSelectingDate;
  final FormatToString getDayName;
  final FormatToString getMonthName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select a date for your booking:',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: dateOptions.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final date = dateOptions[index];
              final isSelected = isSameDay(date, selectedDate);

              return GestureDetector(
                onTap: () => onSelectingDate(date),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppPalette.firstColor
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getDayName(date.weekday),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        getMonthName(date.month),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
