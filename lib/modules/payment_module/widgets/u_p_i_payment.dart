// u_p_i_payment.dart
import 'package:bite_and_seat/modules/payment_module/utils/u_p_i_payment_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/payment_container.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';

class UPIPayment extends StatefulWidget {
  final int orderId;
  final double amount;

  const UPIPayment({super.key, required this.orderId, required this.amount});

  @override
  State<UPIPayment> createState() => _UPIPaymentState();
}

class _UPIPaymentState extends State<UPIPayment> {
  late final UPIPaymentHelper _upiPaymentHelper;

  @override
  void initState() {
    super.initState();
    _upiPaymentHelper = UPIPaymentHelper(
      context: context,
      orderId: widget.orderId,
      amount: widget.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return PaymentContainer(
      paymentForm: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'UPI',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Form(
            key: paymentProvider.upiFormKey,
            child: TextFormField(
              controller: paymentProvider.upiController,
              decoration: const InputDecoration(
                labelText: 'UPI ID',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your UPI ID';
                }
                final RegExp regex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+$',
                );
                if (!regex.hasMatch(value)) {
                  return 'Invalid UPI id format';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonWidth: double.infinity,
            backgroundColor: AppPalette.firstColor,
            textColor: Colors.white,
            labelText: 'Pay',
            onClick: _upiPaymentHelper.upiPayement,
          ),
        ],
      ),
    );
  }
}
