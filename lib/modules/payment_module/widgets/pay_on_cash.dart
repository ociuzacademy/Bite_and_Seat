import 'package:bite_and_seat/modules/payment_module/utils/pay_on_cash_helper.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/payment_container.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';

class PayOnCash extends StatefulWidget {
  final int orderId;
  final double amount;
  const PayOnCash({super.key, required this.orderId, required this.amount});

  @override
  State<PayOnCash> createState() => _PayOnCashState();
}

class _PayOnCashState extends State<PayOnCash> {
  late final PayOnCashHelper _payOnCashHelper;

  @override
  void initState() {
    super.initState();
    _payOnCashHelper = PayOnCashHelper(
      context: context,
      orderId: widget.orderId,
      amount: widget.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PaymentContainer(
      paymentForm: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pay on Cash',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonWidth: double.infinity,
            backgroundColor: AppPalette.firstColor,
            textColor: Colors.white,
            labelText: 'Pay',
            onClick: _payOnCashHelper.payOnCash,
          ),
        ],
      ),
    );
  }
}
