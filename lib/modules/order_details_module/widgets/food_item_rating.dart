// food_item_rating.dart
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/api_models/order_details_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/typedefs/change_star_rating.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/star_rating.dart';

class FoodItemRating extends StatelessWidget {
  final Item item;
  final int currentRating;
  final ChangeStarRating onRatingChanged;

  const FoodItemRating({
    super.key,
    required this.item,
    required this.currentRating,
    required this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Text(
              item.foodItemName,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          // Star Rating for this item
          StarRating(rating: currentRating, onRatingChanged: onRatingChanged),
        ],
      ),
    );
  }
}
