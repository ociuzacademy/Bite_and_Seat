// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:flutter/material.dart';

class DisabledTabContent extends StatelessWidget {
  const DisabledTabContent({super.key, required this.foodTime});

  final FoodTime foodTime;

  @override
  Widget build(BuildContext context) {
    String message = '';
    switch (foodTime) {
      case FoodTime.breakfast:
        message = 'Breakfast is no longer available for today (after 11:00 AM)';
        break;
      case FoodTime.lunch:
        message = 'Lunch is no longer available for today (after 3:00 PM)';
        break;
      case FoodTime.eveningSnacks:
        message =
            'Evening snacks are no longer available for today (after 6:00 PM)';
        break;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.access_time, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Time Restriction',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}
