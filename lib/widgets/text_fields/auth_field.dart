// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const AuthField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _isVisible.value = widget.isPassword;
  }

  @override
  void dispose() {
    super.dispose();
    _isVisible.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isVisible,
      builder: (context, isVisible, child) {
        // debugPrint('Hint: ${widget.hintText} isVisible: $isVisible');
        return TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppPalette.greyColor),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: isVisible
                          ? AppPalette.greyColor
                          : AppPalette.firstColor,
                    ),
                    onPressed: () {
                      _isVisible.value = !isVisible;
                    },
                  )
                : null,
          ),
          style: const TextStyle(color: AppPalette.blackColor),
          validator:
              widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return '${widget.hintText} is missing';
                }
                return null;
              },
          obscureText: isVisible,
          keyboardType: widget.keyboardType,
        );
      },
    );
  }
}
