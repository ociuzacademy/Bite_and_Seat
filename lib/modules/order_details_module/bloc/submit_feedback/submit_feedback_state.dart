part of 'submit_feedback_bloc.dart';

@freezed
sealed class SubmitFeedbackState with _$SubmitFeedbackState {
  const factory SubmitFeedbackState.initial() = SubmitFeedbackInitial;
  const factory SubmitFeedbackState.submitFeedbackLoading() =
      SubmitFeedbackLoading;
  const factory SubmitFeedbackState.submitFeedbackError(String errorMessage) =
      SubmitFeedbackError;
  const factory SubmitFeedbackState.submitFeedbackSuccess(
    SubmitFeedbackResponseModel response,
  ) = SubmitFeedbackSuccess;
}
