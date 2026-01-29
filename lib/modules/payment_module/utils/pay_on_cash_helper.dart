// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/bloc/payment_bloc.dart';
import 'package:bite_and_seat/modules/payment_module/classes/cash_payment_data.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PayOnCashHelper {
  final BuildContext context;
  final int orderId;
  final double amount;
  const PayOnCashHelper({
    required this.context,
    required this.orderId,
    required this.amount,
  });

  // pay_on_cash_helper.dart
  void payOnCash() {
    final PaymentProvider provider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
    final CashPaymentData cashPaymentData = provider.validateCashPaymentData();

    Navigator.pop(context);
    final PaymentBloc paymentBloc = context.read<PaymentBloc>();
    paymentBloc.add(PaymentEvent.cashPaymentStarted(cashPaymentData));
  }
}
