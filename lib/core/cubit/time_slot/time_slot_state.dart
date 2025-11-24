part of 'time_slot_cubit.dart';

@freezed
sealed class TimeSlotState with _$TimeSlotState {
  const factory TimeSlotState.initial() = TimeSlotInitial;
  const factory TimeSlotState.timeSlotLoading() = TimeSlotLoading;
  const factory TimeSlotState.timeSlotError(String errorMessage) =
      TimeSlotError;
  const factory TimeSlotState.categoryTimeSlotsSuccess(
    List<CategoryTimeSlotModel> timeSlots,
  ) = CategoryTimeSlotsSuccess;
}
