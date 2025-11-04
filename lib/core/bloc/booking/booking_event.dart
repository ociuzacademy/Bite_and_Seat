part of 'booking_bloc.dart';

@freezed
sealed class BookingEvent with _$BookingEvent {
  const factory BookingEvent.started() = _Started;
  const factory BookingEvent.step1BookingStarted(
    Step1BookingDetails bookingDetails,
  ) = _Step1BookingStarted;
}
