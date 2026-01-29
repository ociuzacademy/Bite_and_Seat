import 'package:bite_and_seat/modules/payment_module/models/payment_response_model.dart';
import 'package:bite_and_seat/modules/payment_module/services/payment_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/payment_module/classes/card_data.dart';
import 'package:bite_and_seat/modules/payment_module/classes/u_p_i_data.dart';
import 'package:bite_and_seat/modules/payment_module/classes/cash_payment_data.dart';

part 'payment_bloc.freezed.dart';
part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitial()) {
    on<_UpiPaymentStarted>(_onUpiPayment);
    on<_CardPaymentStarted>(_onCardPayment);
    on<_CashPaymentStarted>(_onCashPaymentStarted);
  }

  Future<void> _onUpiPayment(
    _UpiPaymentStarted event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentState.paymentLoading());
    try {
      final PaymentResponseModel response =
          await PaymentServices.submitUpiPayment(upiData: event.upiData);
      emit(PaymentState.paymentSuccess(response));
    } catch (e) {
      emit(PaymentState.paymentError(e.toString()));
    }
  }

  Future<void> _onCardPayment(
    _CardPaymentStarted event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentState.paymentLoading());
    try {
      final PaymentResponseModel response =
          await PaymentServices.submitCardPayment(cardData: event.cardData);
      emit(PaymentState.paymentSuccess(response));
    } catch (e) {
      emit(PaymentState.paymentError(e.toString()));
    }
  }

  Future<void> _onCashPaymentStarted(
    _CashPaymentStarted event,
    Emitter<PaymentState> emit,
  ) async {
    emit(const PaymentState.paymentLoading());
    try {
      final PaymentResponseModel response =
          await PaymentServices.submitCashPayment(
            cashData: event.cashPaymentData,
          );
      emit(PaymentState.paymentSuccess(response));
    } catch (e) {
      emit(PaymentState.paymentError(e.toString()));
    }
  }
}
