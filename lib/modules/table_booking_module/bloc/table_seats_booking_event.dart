part of 'table_seats_booking_bloc.dart';

@freezed
sealed class TableSeatsBookingEvent with _$TableSeatsBookingEvent {
  const factory TableSeatsBookingEvent.started() = _Started;
  const factory TableSeatsBookingEvent.bookingTableSeats(
    int orderId,
    SelectedTablesModel selectedTables,
  ) = _BookingTableSeats;
}
