// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/order_details_module/typedefs/change_star_rating.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final ChangeStarRating onRatingChanged;
  const StarRating({
    super.key,
    required this.rating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            onRatingChanged(index + 1);
          },
          child: Icon(
            index < rating ? Icons.star : Icons.star_border,
            color: AppPalette.firstColor,
            size: 32,
          ),
        );
      }),
    );
  }
}
