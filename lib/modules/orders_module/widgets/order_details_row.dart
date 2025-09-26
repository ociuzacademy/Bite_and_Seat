// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';

class OrderDetailsRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const OrderDetailsRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppPalette.greyColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
