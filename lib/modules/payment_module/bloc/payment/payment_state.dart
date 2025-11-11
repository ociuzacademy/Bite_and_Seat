part of 'payment_bloc.dart';

@freezed
sealed class PaymentState with _$PaymentState {
  const factory PaymentState.initial() = PaymentInitial;
  const factory PaymentState.paymentLoading() = PaymentLoading;
  const factory PaymentState.paymentError(String errorMessage) = PaymentError;
  const factory PaymentState.paymentSuccess(PaymentResponseModel response) =
      PaymentSuccess;
}
