import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final String? message;
  final double indicatorSize;
  final Color indicatorColor;
  final bool useSliver;
  final EdgeInsets padding;
  final bool expand;
  final MainAxisAlignment alignment;
  final TextStyle? messageStyle;
  final double spacing;

  const CustomLoadingWidget({
    super.key,
    this.message,
    this.indicatorSize = 32.0,
    this.indicatorColor = Colors.blue,
    this.useSliver = false,
    this.padding = EdgeInsets.zero,
    this.expand = false, // Changed default to false to prevent issues
    this.alignment = MainAxisAlignment.center,
    this.messageStyle,
    this.spacing = 16.0,
  });

  // Constructor for sliver usage
  const CustomLoadingWidget.sliver({
    super.key,
    this.message,
    this.indicatorSize = 32.0,
    this.indicatorColor = Colors.blue,
    this.useSliver = true,
    this.padding = EdgeInsets.zero,
    this.expand = false,
    this.alignment = MainAxisAlignment.center,
    this.messageStyle,
    this.spacing = 16.0,
  });

  // Constructor for small loading indicator
  const CustomLoadingWidget.small({
    super.key,
    this.message,
    this.indicatorSize = 20.0,
    this.indicatorColor = Colors.blue,
    this.useSliver = false,
    this.padding = EdgeInsets.zero,
    this.expand = false,
    this.alignment = MainAxisAlignment.center,
    this.messageStyle,
    this.spacing = 8.0,
  });

  // Constructor for full screen loading - FIXED VERSION
  const CustomLoadingWidget.fullScreen({
    super.key,
    this.message = 'Loading...',
    this.indicatorSize = 48.0,
    this.indicatorColor = Colors.blue,
    this.useSliver = false,
    this.padding = const EdgeInsets.all(32.0),
    this.expand = false, // Never use Expanded in full screen
    this.alignment = MainAxisAlignment.center,
    this.messageStyle,
    this.spacing = 24.0,
  });

  // Constructor for button loading state
  const CustomLoadingWidget.button({
    super.key,
    this.message,
    this.indicatorSize = 16.0,
    this.indicatorColor = Colors.white,
    this.useSliver = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.expand = false,
    this.alignment = MainAxisAlignment.center,
    this.messageStyle = const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    this.spacing = 8.0,
  });

  // Simple constructor for basic centered loading
  const CustomLoadingWidget.centered({
    super.key,
    this.message,
    this.indicatorSize = 32.0,
    this.indicatorColor = Colors.blue,
    this.useSliver = false,
    this.padding = EdgeInsets.zero,
    this.expand = false,
    this.alignment = MainAxisAlignment.center,
    this.messageStyle,
    this.spacing = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final loadingContent = Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: alignment,
        children: [
          SizedBox(
            width: indicatorSize,
            height: indicatorSize,
            child: CircularProgressIndicator(
              strokeWidth: _getStrokeWidth(),
              valueColor: AlwaysStoppedAnimation<Color>(indicatorColor),
            ),
          ),
          if (message != null) ...[
            SizedBox(height: spacing),
            Text(
              message!,
              style: messageStyle ?? _getDefaultMessageStyle(context),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );

    // FIXED: Only use Expanded when explicitly requested AND not using sliver
    if (useSliver) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: loadingContent),
      );
    } else if (expand) {
      // Only use Expanded if we're in a Flex parent and expand is explicitly true
      return Expanded(child: Center(child: loadingContent));
    } else {
      return Center(child: loadingContent);
    }
  }

  double _getStrokeWidth() {
    if (indicatorSize <= 20.0) return 2.0;
    if (indicatorSize <= 32.0) return 3.0;
    return 4.0;
  }

  TextStyle _getDefaultMessageStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.grey[600],
          fontSize: 14,
        ) ??
        const TextStyle(fontSize: 14, color: Colors.grey);
  }
}
