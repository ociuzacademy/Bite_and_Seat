// daily_menu_error_widget.dart
import 'package:flutter/material.dart';

import 'package:bite_and_seat/widgets/buttons/primary_button.dart';
import 'package:bite_and_seat/widgets/buttons/secondary_button.dart';

class DailyMenuErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;
  final VoidCallback onBookTable;

  const DailyMenuErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
    required this.onBookTable,
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
              Icons.error_outline_rounded,
              size: 80,
              color: isDark ? Colors.red[300] : Colors.red[400],
            ),
            const SizedBox(height: 24),
            Text(
              'Error Loading Menu',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.red[300] : Colors.red[600],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // Action Buttons
            Column(
              children: [
                // Retry Button
                PrimaryButton(
                  text: 'Try Again',
                  onPressed: onRetry,
                  isFullWidth: true,
                ),
                const SizedBox(height: 12),
                // Book Table Button
                SecondaryButton(
                  text: 'Book Table Directly',
                  onPressed: onBookTable,
                  isFullWidth: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
