// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/widgets/u_p_i_payment.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/card_payment.dart';

class PaymentHelper {
  final BuildContext context;
  final DateTime selectedDate;
  final TimeSlotModel selectedTimeSlot;
  final int numberOfPersons;
  final String selectedRoomId;
  final String selectedTableId;
  final double totalRate;
  final ValueNotifier<String?> selectedMethod;
  PaymentHelper({
    required this.context,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPersons,
    required this.selectedRoomId,
    required this.selectedTableId,
    required this.totalRate,
    required this.selectedMethod,
  });

  void makePayment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        switch (selectedMethod.value) {
          case "UPI":
            return UPIPayment(
              amount: totalRate,
              selectedDate: selectedDate,
              selectedTimeSlot: selectedTimeSlot,
              numberOfPersons: numberOfPersons,
              selectedRoomId: selectedRoomId,
              selectedTableId: selectedTableId,
            );
          default:
            return CardPayment(
              amount: totalRate,
              selectedDate: selectedDate,
              selectedTimeSlot: selectedTimeSlot,
              numberOfPersons: numberOfPersons,
              selectedRoomId: selectedRoomId,
              selectedTableId: selectedTableId,
            );
        }
      },
    );
  }
}
