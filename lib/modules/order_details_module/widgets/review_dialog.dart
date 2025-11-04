// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/utils/review_dialog_helper.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/food_item_rating.dart';
import 'package:bite_and_seat/modules/order_details_module/widgets/star_rating.dart';

class ReviewDialog extends StatefulWidget {
  final String orderId;
  final List<CartItemModel> foodItems;

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

  final TextEditingController _commentController = TextEditingController();

  late final ValueNotifier<Map<int, int>> _itemRatings;
  late final ValueNotifier<int> _overallRating;

  @override
  void initState() {
    super.initState();

    // Initialize ratings/images maps to defaults for all items
    final initialRatings = <int, int>{};
    for (var item in widget.foodItems) {
      initialRatings[item.itemId] = 0;
    }

    _itemRatings = ValueNotifier<Map<int, int>>(initialRatings);
    _overallRating = ValueNotifier<int>(0);

    _reviewDialogHelper = ReviewDialogHelper(
      context: context,
      orderId: widget.orderId,
      commentController: _commentController,
      itemRatings: _itemRatings,
      overallRating: _overallRating,
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    _itemRatings.dispose();
    _overallRating.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            ValueListenableBuilder<int>(
              valueListenable: _overallRating,
              builder: (context, overallRating, _) {
                return StarRating(
                  rating: overallRating,
                  onRatingChanged: (rating) {
                    _overallRating.value = rating;
                  },
                );
              },
            ),
            const SizedBox(height: 16),

            // Food Item Ratings
            const Text(
              'Rate each food item:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Rebuild list when either ratings or images change
            ValueListenableBuilder<Map<int, int>>(
              valueListenable: _itemRatings,
              builder: (context, itemRatings, _) {
                return Column(
                  children: [
                    ...widget.foodItems.map((item) {
                      return FoodItemRating(
                        item: item,
                        itemRatings: itemRatings,
                        onChangingStarRating: (rating) {
                          final updated = Map<int, int>.from(itemRatings);
                          updated[item.itemId] = rating;
                          _itemRatings.value = updated;
                        },
                      );
                    }),
                  ],
                );
              },
            ),

            const SizedBox(height: 16),

            // Comment Field
            TextField(
              controller: _commentController,
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
                onPressed: _reviewDialogHelper.submitReview,
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
