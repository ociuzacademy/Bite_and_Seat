// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String?)? validator;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObscure = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppPalette.greyColor),
      ),
      style: const TextStyle(color: AppPalette.blackColor),
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '$hintText is missing';
            }
            return null;
          },
      obscureText: isObscure,
    );
  }
}
