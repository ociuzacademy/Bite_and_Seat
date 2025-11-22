part of 'submit_complaint_bloc.dart';

@freezed
sealed class SubmitComplaintEvent with _$SubmitComplaintEvent {
  const factory SubmitComplaintEvent.started() = _Started;
  const factory SubmitComplaintEvent.submittingComplaint(
    ComplaintsData complaintsData,
  ) = _SubmittingComplaint;
}
