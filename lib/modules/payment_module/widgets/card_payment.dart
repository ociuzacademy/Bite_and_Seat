// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:bite_and_seat/modules/payment_module/utils/card_payment_helper.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/expiry_date_field.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/payment_container.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:bite_and_seat/widgets/text_fields/normal_text_field.dart';

class CardPayment extends StatefulWidget {
  final double amount;
  final DateTime selectedDate;
  final CategoryTimeSlotModel selectedTimeSlot;
  final int numberOfPersons;
  final String selectedRoomId;
  final String selectedTableId;
  const CardPayment({
    super.key,
    required this.amount,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPersons,
    required this.selectedRoomId,
    required this.selectedTableId,
  });

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  late final CardPaymentHelper _cardPaymentHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cardPaymentHelper = CardPaymentHelper(
      context: context,
      formKey: _formKey,
      amount: widget.amount,
      selectedDate: widget.selectedDate,
      selectedTimeSlot: widget.selectedTimeSlot,
      numberOfPersons: widget.numberOfPersons,
      selectedRoomId: widget.selectedRoomId,
      selectedTableId: widget.selectedTableId,
    );
  }

  @override
  void dispose() {
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PaymentContainer(
      paymentForm: Form(
        key: _formKey,
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
              textEditingController: _cardNameController,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the cardholder name';
                }
                return null;
              },
              labelText: 'Cardholder Name',
              hintText: "Enter cardholder's name",
              onChange: (value) {
                _cardNameController.value = _cardNameController.value.copyWith(
                  text: value?.toUpperCase(), // Convert to uppercase
                  selection: TextSelection.collapsed(
                    offset: value!.length, // Keep cursor at the end
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            NormalTextField(
              textEditingController: _cardNumberController,
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
                  child: ExpiryDateField(controller: _expiryDateController),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _cvvController,
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
