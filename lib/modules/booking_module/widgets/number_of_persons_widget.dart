// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';

class NumberOfPersonsWidget extends StatelessWidget {
  final int numberOfPersons;
  final VoidCallback onRemovingNumberOfPersons;
  final VoidCallback onAddingNumberOfPersons;
  const NumberOfPersonsWidget({
    super.key,
    required this.numberOfPersons,
    required this.onRemovingNumberOfPersons,
    required this.onAddingNumberOfPersons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'How many people will be dining?',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle, size: 36),
              color: AppPalette.firstColor,
              onPressed: onRemovingNumberOfPersons,
            ),
            const SizedBox(width: 24),
            Text(
              '$numberOfPersons',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 24),
            IconButton(
              icon: const Icon(Icons.add_circle, size: 36),
              color: AppPalette.firstColor,
              onPressed: onAddingNumberOfPersons,
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Maximum 10 persons per booking',
          style: TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
