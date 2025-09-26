import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpiryDateField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const ExpiryDateField({super.key, required this.controller, this.validator});

  @override
  State<ExpiryDateField> createState() => _ExpiryDateFieldState();
}

class _ExpiryDateFieldState extends State<ExpiryDateField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: const InputDecoration(
        labelText: 'Expiry Date (MM/YY)',
        hintText: 'MM/YY',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.datetime,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // Only digits
        LengthLimitingTextInputFormatter(5), // Max length: 5 (MM/YY)
        _ExpiryDateInputFormatter(), // Improved formatter
      ],
      validator: widget.validator ?? _validateExpiryDate,
    );
  }

  // Expiry Date Validation
  String? _validateExpiryDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter expiry date';
    }

    final RegExp regex = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
    if (!regex.hasMatch(value)) {
      return 'Invalid format (MM/YY)';
    }

    final parts = value.split('/');
    final int month = int.parse(parts[0]);
    final int year = int.parse('20${parts[1]}');

    final DateTime now = DateTime.now();
    final DateTime expiryDate = DateTime(year, month + 1, 0);

    if (expiryDate.isBefore(now)) {
      return 'Card expired';
    }

    return null;
  }
}

// Input Formatter to add `/` automatically
// Improved Input Formatter to keep `/` at the correct position
class _ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.replaceAll('/', '');

    if (text.length > 4) {
      text = text.substring(0, 4); // Limit to MMYY format
    }

    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i == 2) {
        buffer.write('/'); // Add `/` after the second digit
      }
      buffer.write(text[i]);
    }

    final formattedText = buffer.toString();

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
