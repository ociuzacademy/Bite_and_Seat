import 'package:flutter/material.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';

class DateSelectionWidget extends StatelessWidget {
  final DateTime selectedDate;
  final String dateSelectionType;
  final Future<void> Function() onDateSelected;
  final VoidCallback onTodaySelected;

  const DateSelectionWidget({
    super.key,
    required this.selectedDate,
    required this.dateSelectionType,
    required this.onDateSelected,
    required this.onTodaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPalette.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2), // FIXED: Use withOpacity
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Date',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppPalette.firstColor,
            ),
          ),
          const SizedBox(height: 12),

          // Radio Buttons
          Row(
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: 'Today',
                    groupValue: dateSelectionType,
                    onChanged: (value) {
                      onTodaySelected();
                    },
                    activeColor: AppPalette.firstColor,
                  ),
                  GestureDetector(
                    onTap: onTodaySelected,
                    child: const Text(
                      'Today',
                      style: TextStyle(
                        color: AppPalette.firstColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Row(
                children: [
                  Radio<String>(
                    value: 'Custom Date',
                    groupValue: dateSelectionType,
                    onChanged: (value) {
                      onDateSelected();
                    },
                    activeColor: AppPalette.firstColor,
                  ),
                  GestureDetector(
                    onTap: onDateSelected,
                    child: const Text(
                      'Custom Date',
                      style: TextStyle(
                        color: AppPalette.firstColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Selected Date Display
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Selected: ${_formatDate(selectedDate)}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppPalette.greyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today (${date.day}/${date.month}/${date.year})';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow (${date.day}/${date.month}/${date.year})';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
