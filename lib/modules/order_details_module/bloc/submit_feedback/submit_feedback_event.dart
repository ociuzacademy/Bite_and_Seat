part of 'submit_feedback_bloc.dart';

@freezed
sealed class SubmitFeedbackEvent with _$SubmitFeedbackEvent {
  const factory SubmitFeedbackEvent.started() = _Started;
  const factory SubmitFeedbackEvent.submittingFeedback(
    FeedbackData feedbackData,
  ) = _SubmittingFeedback;
}
