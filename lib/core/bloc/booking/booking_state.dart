part of 'booking_bloc.dart';

@freezed
sealed class BookingState with _$BookingState {
  const factory BookingState.initial() = BookingInitial;
  const factory BookingState.bookingLoading() = BookingLoading;
  const factory BookingState.bookingError(String errorMessage) = BookingError;
  const factory BookingState.step1Completed(BookingResponseModel response) =
      Step1Completed;
}
