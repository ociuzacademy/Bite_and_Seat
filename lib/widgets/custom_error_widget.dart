import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String errorMessage;
  final String title;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final String buttonText;
  final bool useSliver;
  final EdgeInsets padding;
  final bool showButton;

  const CustomErrorWidget({
    super.key,
    required this.onRetry,
    required this.errorMessage,
    this.title = 'Error loading data',
    this.icon = Icons.error_outline,
    this.iconSize = 64,
    this.iconColor = Colors.red,
    this.buttonText = 'Retry',
    this.useSliver = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 32.0),
    this.showButton = true,
  });

  // Constructor for sliver usage
  const CustomErrorWidget.sliver({
    super.key,
    required this.onRetry,
    required this.errorMessage,
    this.title = 'Error loading data',
    this.icon = Icons.error_outline,
    this.iconSize = 64,
    this.iconColor = Colors.red,
    this.buttonText = 'Retry',
    this.useSliver = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 32.0),
    this.showButton = true,
  });

  // Constructor for network errors
  factory CustomErrorWidget.networkError({
    Key? key,
    required VoidCallback onRetry,
    String errorMessage =
        'Please check your internet connection and try again.',
    bool useSliver = false,
  }) {
    return CustomErrorWidget(
      key: key,
      onRetry: onRetry,
      errorMessage: errorMessage,
      title: 'Network Error',
      icon: Icons.wifi_off,
      iconColor: Colors.orange,
      useSliver: useSliver,
    );
  }

  // Constructor for empty states
  factory CustomErrorWidget.emptyState({
    Key? key,
    required String message,
    String title = 'No Data Found',
    IconData icon = Icons.inventory_2_outlined,
    bool useSliver = false,
  }) {
    return CustomErrorWidget(
      key: key,
      onRetry: () {},
      errorMessage: message,
      title: title,
      icon: icon,
      iconColor: Colors.grey,
      buttonText: '',
      useSliver: useSliver,
      showButton: false,
    );
  }

  // Constructor for loading errors
  factory CustomErrorWidget.loadingError({
    Key? key,
    required VoidCallback onRetry,
    String errorMessage = 'Failed to load data. Please try again.',
    bool useSliver = false,
  }) {
    return CustomErrorWidget(
      key: key,
      onRetry: onRetry,
      errorMessage: errorMessage,
      title: 'Loading Error',
      useSliver: useSliver,
    );
  }

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize, color: iconColor),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            if (showButton) ...[
              const SizedBox(height: 16),
              ElevatedButton(onPressed: onRetry, child: Text(buttonText)),
            ],
          ],
        ),
      ),
    );

    if (useSliver) {
      return SliverFillRemaining(child: content);
    } else {
      return content;
    }
  }
}
