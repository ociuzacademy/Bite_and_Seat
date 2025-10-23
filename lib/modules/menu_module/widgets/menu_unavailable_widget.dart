// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MenuUnavailableWidget extends StatelessWidget {
  final String message;
  final String formatedDate;
  const MenuUnavailableWidget({
    super.key,
    required this.message,
    required this.formatedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.restaurant_menu, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'No Menu Available',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Selected Date: $formatedDate',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
