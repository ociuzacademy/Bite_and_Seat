// review_dialog_helper.dart
import 'package:bite_and_seat/modules/order_details_module/bloc/submit_feedback_bloc.dart';
import 'package:bite_and_seat/modules/order_details_module/class/feedback_data.dart';
import 'package:flutter/material.dart';
import 'package:bite_and_seat/modules/order_details_module/providers/review_provider.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    debugPrint('submitting feedback...');
    final FeedbackData? feedbackData = reviewProvider.validateFeedbackData();

    if (feedbackData != null) {
      debugPrint('feedback data generated...');
      Navigator.of(context).pop();
      final SubmitFeedbackBloc submitFeedbackBloc = context
          .read<SubmitFeedbackBloc>();
      submitFeedbackBloc.add(
        SubmitFeedbackEvent.submittingFeedback(feedbackData),
      );
    }
  }
}
