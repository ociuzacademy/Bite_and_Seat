part of 'time_slot_booking_bloc.dart';

@freezed
sealed class TimeSlotBookingState with _$TimeSlotBookingState {
  const factory TimeSlotBookingState.initial() = TimeSlotBookingInitial;
  const factory TimeSlotBookingState.timeSlotBookingLoading() =
      TimeSlotBookingLoading;
  const factory TimeSlotBookingState.timeSlotBookingError(String errorMessage) =
      TimeSlotBookingError;
  const factory TimeSlotBookingState.timeSlotBookingSuccess(
    BookingResponseModel response,
  ) = TimeSlotBookingSuccess;
}
