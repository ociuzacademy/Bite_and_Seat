part of 'submit_complaint_bloc.dart';

@freezed
sealed class SubmitComplaintState with _$SubmitComplaintState {
  const factory SubmitComplaintState.initial() = SubmitComplaintInitial;
  const factory SubmitComplaintState.submitComplaintLoading() =
      SubmitComplaintLoading;
  const factory SubmitComplaintState.submitComplaintError(String errorMessage) =
      SubmitComplaintError;
  const factory SubmitComplaintState.submitComplaintSuccess(
    SubmitReportResponseModel response,
  ) = SubmitComplaintSuccess;
}
