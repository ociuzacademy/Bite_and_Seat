// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onSubmit;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onSubmit,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55),
        backgroundColor: AppPalette.firstColor,
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppPalette.whiteColor,
        ),
      ),
    );
  }
}
