// review_provider.dart
import 'package:bite_and_seat/modules/order_details_module/class/feedback_data.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/api_models/order_details_model.dart';

class ReviewProvider with ChangeNotifier {
  final int orderId;
  final List<Item> foodItems;

  final TextEditingController _commentController = TextEditingController();
  final Map<int, int> _itemRatings = {};
  int _overallRating = 0;

  ReviewProvider({required this.orderId, required this.foodItems}) {
    // Initialize all items with 0 rating
    for (var item in foodItems) {
      _itemRatings[item.foodItemId] = 0;
    }
  }

  // Getters
  TextEditingController get commentController => _commentController;
  Map<int, int> get itemRatings => _itemRatings;
  int get overallRating => _overallRating;

  // Get rating for a specific item
  int getRatingForItem(int itemId) => _itemRatings[itemId] ?? 0;

  // Setters
  void setOverallRating(int rating) {
    _overallRating = rating;
    notifyListeners();
  }

  void setItemRating(int itemId, int rating) {
    _itemRatings[itemId] = rating;
    notifyListeners();
  }

  void setComment(String comment) {
    _commentController.text = comment;
    // No need to notify for text changes as the controller handles UI updates
  }

  // Validation
  bool get hasUnratedItems => _itemRatings.values.any((rating) => rating == 0);
  bool get isOverallRatingSet => _overallRating > 0;

  // Get review data for submission
  Map<String, dynamic> get reviewData {
    return {
      'orderId': orderId,
      'overallRating': _overallRating,
      'comment': _commentController.text.trim(),
      'itemRatings': Map<int, int>.from(_itemRatings),
    };
  }

  FeedbackData? validateFeedbackData() {
    // Validate overall rating
    if (!isOverallRatingSet) {
      return null;
    }

    // Validate that all items have ratings
    if (hasUnratedItems) {
      return null;
    }

    return FeedbackData(
      orderId: orderId,
      overallRating: _overallRating,
      comments: _commentController.text.trim(),
      itemRatings: foodItems
          .map(
            (foodItem) => ItemRating(
              foodItem: foodItem.foodItemId,
              rating: _itemRatings[foodItem.foodItemId]!,
            ),
          )
          .toList(),
    );
  }

  // Reset all ratings
  void resetRatings() {
    _overallRating = 0;
    for (var item in foodItems) {
      _itemRatings[item.foodItemId] = 0;
    }
    _commentController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
