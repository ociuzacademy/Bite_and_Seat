// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/bloc/payment/payment_bloc.dart';
import 'package:bite_and_seat/modules/payment_module/classes/card_data.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:provider/provider.dart';

class CardPaymentHelper {
  final BuildContext context;
  final int orderId;
  final double amount;
  const CardPaymentHelper({
    required this.context,
    required this.orderId,
    required this.amount,
  });

  void cardPayment() {
    final PaymentProvider provider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
    if (provider.cardFormKey.currentState!.validate()) {
      final CardData? cardData = provider.validateCardData();

      if (cardData != null) {
        Navigator.pop(context);
        final PaymentBloc paymentBloc = context.read<PaymentBloc>();
        paymentBloc.add(PaymentEvent.cardPaymentStarted(cardData));
      }
    } else {
      CustomSnackbar.showError(
        context,
        message: 'Please fill all card details',
      );
    }
  }
}
