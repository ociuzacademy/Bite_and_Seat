part of 'menu_booking_bloc.dart';

@freezed
sealed class MenuBookingState with _$MenuBookingState {
  const factory MenuBookingState.initial() = MenuBookingInitial;
  const factory MenuBookingState.menuBookingLoading() = MenuBookingLoading;
  const factory MenuBookingState.menuBookingError(String errorMessage) =
      MenuBookingError;
  const factory MenuBookingState.menuBookingSuccess(
    BookingResponseModel response,
  ) = MenuBookingSuccess;
}
