// ignore_for_file: public_member_api_docs, sort_constructors_first
// food_item_container.dart

import 'package:flutter/material.dart';

class BrokenImagePlaceholder extends StatelessWidget {
  const BrokenImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      alignment: Alignment.center,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.broken_image_outlined, color: Colors.grey, size: 28),
          SizedBox(height: 4),
          Text(
            'Image unavailable',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
