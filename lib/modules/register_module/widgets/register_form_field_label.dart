import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class RegisterFormFieldLabel extends StatelessWidget {
  const RegisterFormFieldLabel({
    super.key,
    required this.context,
    required this.text,
  });

  final BuildContext context;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        color: AppPalette.firstColor.withValues(alpha: 0.8),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
