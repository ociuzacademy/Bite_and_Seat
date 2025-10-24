// menu_unavailable_widget.dart
import 'package:flutter/material.dart';

import 'package:bite_and_seat/widgets/buttons/primary_button.dart';
import 'package:bite_and_seat/widgets/buttons/secondary_button.dart';

class MenuUnavailableWidget extends StatelessWidget {
  final String message;
  final String formatedDate;
  final VoidCallback onBookTable;
  final VoidCallback? onRetry;

  const MenuUnavailableWidget({
    super.key,
    required this.message,
    required this.formatedDate,
    required this.onBookTable,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu_outlined,
              size: 80,
              color: isDark ? Colors.grey[500] : Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              'No Menu Available',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Selected Date: $formatedDate',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Book Table Button
            PrimaryButton(
              text: 'Book Table Directly',
              onPressed: onBookTable,
              isFullWidth: true,
            ),
            const SizedBox(height: 12),
            // Optional Retry Button
            if (onRetry != null) ...[
              SecondaryButton(
                text: 'Try Again',
                onPressed: onRetry!,
                isFullWidth: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
