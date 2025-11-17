part of 'table_seats_booking_bloc.dart';

@freezed
sealed class TableSeatsBookingState with _$TableSeatsBookingState {
  const factory TableSeatsBookingState.initial() = TableSeatsBookingInitial;
  const factory TableSeatsBookingState.tableSeatsBookingLoading() =
      TableSeatsBookingLoading;
  const factory TableSeatsBookingState.tableSeatsBookingError(
    String errorMessage,
  ) = TableSeatsBookingError;
  const factory TableSeatsBookingState.tableSeatsBookingSuccess(
    BookingResponseModel response,
  ) = TableSeatsBookingSuccess;
}
