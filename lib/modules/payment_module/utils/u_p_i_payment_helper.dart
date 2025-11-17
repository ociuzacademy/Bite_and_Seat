// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/bloc/payment_bloc.dart';
import 'package:bite_and_seat/modules/payment_module/classes/u_p_i_data.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:provider/provider.dart';

class UPIPaymentHelper {
  final BuildContext context;
  final int orderId;
  final double amount;
  const UPIPaymentHelper({
    required this.context,
    required this.orderId,
    required this.amount,
  });

  void upiPayement() {
    final PaymentProvider provider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
    if (provider.cardFormKey.currentState!.validate()) {
      final UPIData? upiData = provider.validateUpiData();

      if (upiData != null) {
        Navigator.pop(context);
        final PaymentBloc paymentBloc = context.read<PaymentBloc>();
        paymentBloc.add(PaymentEvent.upiPaymentStarted(upiData));
      }
    } else {
      CustomSnackbar.showError(context, message: 'Please fill UPI ID.');
    }
  }
}
