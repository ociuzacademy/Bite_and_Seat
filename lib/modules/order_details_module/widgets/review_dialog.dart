// review_dialog.dart
import 'package:bite_and_seat/core/models/api_models/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/providers/review_provider.dart';
import 'package:bite_and_seat/modules/order_details_module/utils/review_dialog_helper.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/food_item_rating.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/star_rating.dart';

class ReviewDialog extends StatefulWidget {
  final int orderId;
  final List<Item> foodItems;

  const ReviewDialog({
    super.key,
    required this.orderId,
    required this.foodItems,
  });

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  late final ReviewDialogHelper _reviewDialogHelper;

  @override
  void initState() {
    super.initState();
    _reviewDialogHelper = ReviewDialogHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          ReviewProvider(orderId: widget.orderId, foodItems: widget.foodItems),
      child: Consumer<ReviewProvider>(
        builder: (context, reviewProvider, child) {
          return Dialog(
            insetPadding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Submit Review',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Overall Rating
                  const Text(
                    'Overall Experience',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  StarRating(
                    rating: reviewProvider.overallRating,
                    onRatingChanged: (rating) {
                      reviewProvider.setOverallRating(rating);
                    },
                  ),
                  const SizedBox(height: 16),

                  // Food Item Ratings
                  const Text(
                    'Rate each food item:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  Column(
                    children: [
                      ...widget.foodItems.map((item) {
                        return FoodItemRating(
                          item: item,
                          currentRating: reviewProvider.getRatingForItem(
                            item.foodItemId,
                          ),
                          onRatingChanged: (rating) {
                            reviewProvider.setItemRating(
                              item.foodItemId,
                              rating,
                            );
                          },
                        );
                      }),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Comment Field
                  TextField(
                    controller: reviewProvider.commentController,
                    decoration: InputDecoration(
                      labelText: 'Additional Comments (optional)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),

                  // Submit Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          _reviewDialogHelper.submitReview(reviewProvider),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPalette.firstColor,
                        foregroundColor: AppPalette.secondColor,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit Review',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
