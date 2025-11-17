part of 'time_slot_booking_bloc.dart';

@freezed
sealed class TimeSlotBookingEvent with _$TimeSlotBookingEvent {
  const factory TimeSlotBookingEvent.started() = _Started;
  const factory TimeSlotBookingEvent.bookingTimeSlot(
    int orderId,
    Step2BookingDetails bookingDetails,
  ) = _BookingTimeSlot;
}
