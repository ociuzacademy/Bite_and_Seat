// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class StatusIndicator extends StatelessWidget {
  final String text;
  final Color color;
  const StatusIndicator({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: AppPalette.blackColor, width: 1),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
