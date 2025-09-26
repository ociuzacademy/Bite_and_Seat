// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;
  final bool isLogout;
  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: isLogout ? AppPalette.errorColor : AppPalette.firstColor,
        ),
        label: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isLogout ? AppPalette.errorColor : AppPalette.blackColor,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPalette.whiteColor,
          foregroundColor: AppPalette.blackColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          alignment: Alignment.centerLeft,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: AppPalette.greyColor.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
