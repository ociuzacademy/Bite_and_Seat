part of 'menu_booking_bloc.dart';

@freezed
sealed class MenuBookingEvent with _$MenuBookingEvent {
  const factory MenuBookingEvent.started() = _Started;
  const factory MenuBookingEvent.bookingMenu(
    Step1BookingDetails bookingDetails,
  ) = _BookingMenu;
}
