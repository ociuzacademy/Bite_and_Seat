// payment_helper.dart
import 'package:bite_and_seat/core/enums/payment_method.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/pay_on_cash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/card_payment.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/u_p_i_payment.dart';

class PaymentHelper {
  final BuildContext context;
  final int orderId;
  final double totalRate;

  const PaymentHelper({
    required this.context,
    required this.orderId,
    required this.totalRate,
  });

  void makePayment() {
    final paymentProvider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        // Use ChangeNotifierProvider.value instead of Provider.value
        return ChangeNotifierProvider<PaymentProvider>.value(
          value: paymentProvider,
          child: Builder(
            builder: (innerContext) {
              switch (paymentProvider.selectedPaymentMethod) {
                case PaymentMethod.upi:
                  return UPIPayment(orderId: orderId, amount: totalRate);
                case PaymentMethod.card:
                  return CardPayment(orderId: orderId, amount: totalRate);
                case PaymentMethod.cash:
                  return PayOnCash(orderId: orderId, amount: totalRate);
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        );
      },
    );
  }
}
