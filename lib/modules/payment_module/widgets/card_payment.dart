// card_payment.dart
import 'package:bite_and_seat/modules/payment_module/utils/card_payment_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/expiry_date_field.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/payment_container.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:bite_and_seat/widgets/text_fields/normal_text_field.dart';

class CardPayment extends StatefulWidget {
  final int orderId;
  final double amount;

  const CardPayment({super.key, required this.orderId, required this.amount});

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  late final CardPaymentHelper _cardPaymentHelper;

  @override
  void initState() {
    super.initState();
    _cardPaymentHelper = CardPaymentHelper(
      context: context,
      orderId: widget.orderId,
      amount: widget.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    final paymentProvider = Provider.of<PaymentProvider>(context);

    return PaymentContainer(
      paymentForm: Form(
        key: paymentProvider.cardFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            NormalTextField(
              textEditingController: paymentProvider.cardNameController,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the cardholder name';
                }
                return null;
              },
              labelText: 'Cardholder Name',
              hintText: "Enter cardholder's name",
              onChange: (value) {
                paymentProvider.cardNameController.value = paymentProvider
                    .cardNameController
                    .value
                    .copyWith(
                      text: value?.toUpperCase(),
                      selection: TextSelection.collapsed(offset: value!.length),
                    );
              },
            ),
            const SizedBox(height: 16),
            NormalTextField(
              textEditingController: paymentProvider.cardNumberController,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the card number';
                }
                if (value.length != 16) {
                  return 'Card number must have only 16 digits';
                }
                return null;
              },
              labelText: 'Card Number',
              hintText: "Enter card's number",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ExpiryDateField(
                    controller: paymentProvider.expiryDateController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: paymentProvider.cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the CVV';
                      }
                      if (value.length != 3) {
                        return 'CVV must have only 3 digits';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
              buttonWidth: double.infinity,
              backgroundColor: AppPalette.firstColor,
              textColor: Colors.white,
              labelText: 'Pay',
              onClick: _cardPaymentHelper.cardPayment,
            ),
          ],
        ),
      ),
    );
  }
}
