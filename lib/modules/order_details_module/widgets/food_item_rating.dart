// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/typedefs/change_star_rating.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/star_rating.dart';

class FoodItemRating extends StatelessWidget {
  final Map<int, int> itemRatings;
  final CartItemModel item;
  final ChangeStarRating onChangingStarRating;
  const FoodItemRating({
    super.key,
    required this.itemRatings,
    required this.item,
    required this.onChangingStarRating,
  });

  @override
  Widget build(BuildContext context) {
    final currentRating = itemRatings[item.itemId] ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppPalette.greyColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),

          // Star Rating for this item
          StarRating(
            rating: currentRating,
            onRatingChanged: onChangingStarRating,
          ),
        ],
      ),
    );
  }
}
