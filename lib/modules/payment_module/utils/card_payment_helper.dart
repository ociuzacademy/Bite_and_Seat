// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:bite_and_seat/modules/qr_code_module/view/q_r_code_page.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class CardPaymentHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final double amount;
  final DateTime selectedDate;
  final CategoryTimeSlotModel selectedTimeSlot;
  final int numberOfPersons;
  final String selectedTableId;
  CardPaymentHelper({
    required this.context,
    required this.formKey,
    required this.amount,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPersons,
    required this.selectedTableId,
  });

  void cardPayment() {
    if (formKey.currentState!.validate()) {
      CustomSnackbar.showSuccess(
        context,
        message: 'Card payment completed successfully.',
      );
      Navigator.of(context).pop(); // close bottom sheet
      Navigator.of(context).pushAndRemoveUntil(
        QRCodePage.route(
          selectedDate: selectedDate,
          selectedTimeSlot: selectedTimeSlot,
          numberOfPersons: numberOfPersons,
          selectedTableId: selectedTableId,
          totalRate: amount,
        ),
        (route) => false,
      );
    } else {
      CustomSnackbar.showError(
        context,
        message: 'Please fill all card details',
      );
    }
  }
}
