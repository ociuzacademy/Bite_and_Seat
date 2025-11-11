part of 'payment_bloc.dart';

@freezed
sealed class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.started() = _Started;
  const factory PaymentEvent.upiPaymentStarted(UPIData upiData) =
      _UpiPaymentStarted;
  const factory PaymentEvent.cardPaymentStarted(CardData cardData) =
      _CardPaymentStarted;
}
