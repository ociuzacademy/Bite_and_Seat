// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DailyMenuErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback loadMenuForSelectedDate;
  const DailyMenuErrorWidget({
    super.key,
    required this.errorMessage,
    required this.loadMenuForSelectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Error Loading Menu',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red[600],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: loadMenuForSelectedDate,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
