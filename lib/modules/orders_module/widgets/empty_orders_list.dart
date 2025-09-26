import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class EmptyOrdersList extends StatelessWidget {
  const EmptyOrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long, size: 64, color: AppPalette.greyColor),
          const SizedBox(height: 16),
          Text(
            'No reservations yet',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppPalette.greyColor),
          ),
          const SizedBox(height: 8),
          Text(
            'Your reservations will appear here',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppPalette.greyColor),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Navigate to booking page
              Navigator.pop(context);
            },
            child: const Text('Make a Reservation'),
          ),
        ],
      ),
    );
  }
}
