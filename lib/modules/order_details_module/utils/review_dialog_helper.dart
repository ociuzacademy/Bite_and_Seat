// review_dialog_helper.dart
import 'package:flutter/material.dart';
import 'package:bite_and_seat/modules/order_details_module/providers/review_provider.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class ReviewDialogHelper {
  final BuildContext context;

  const ReviewDialogHelper({required this.context});

  void submitReview(ReviewProvider reviewProvider) {
    // Validate overall rating
    if (!reviewProvider.isOverallRatingSet) {
      CustomSnackbar.showError(
        context,
        message: 'Please provide an overall rating',
      );
      return;
    }

    // Validate that all items have ratings
    if (reviewProvider.hasUnratedItems) {
      CustomSnackbar.showError(
        context,
        message: 'Please rate all food items before submitting',
      );
      return;
    }

    // Prepare review data
    final reviewData = reviewProvider.reviewData;

    // In a real app, you would send this data to your backend
    debugPrint('Review data: $reviewData');

    Navigator.of(context).pop();
    CustomSnackbar.showSuccess(context, message: 'Thank you for your review!');

    // Dispose the provider when done
    reviewProvider.dispose();
  }
}
