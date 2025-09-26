// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class ReviewDialogHelper {
  final BuildContext context;
  final String orderId;
  final TextEditingController commentController;
  late final ValueNotifier<Map<String, int>> itemRatings;
  late final ValueNotifier<int> overallRating;
  ReviewDialogHelper({
    required this.context,
    required this.orderId,
    required this.commentController,
    required this.itemRatings,
    required this.overallRating,
  });

  void submitReview() {
    // Validate that all items have ratings
    final hasUnratedItems = itemRatings.value.values.any(
      (rating) => rating == 0,
    );
    if (hasUnratedItems) {
      CustomSnackbar.showError(
        context,
        message: 'Please rate all food items before submitting',
      );

      return;
    }

    // Prepare review data
    final reviewData = {
      'orderId': orderId,
      'overallRating': overallRating.value,
      'comment': commentController.text,
      'itemRatings': itemRatings.value,
    };

    // In a real app, you would send this data to your backend
    debugPrint('Review data: $reviewData');

    Navigator.of(context).pop();
    CustomSnackbar.showSuccess(context, message: 'Thank you for your review!');
  }
}
