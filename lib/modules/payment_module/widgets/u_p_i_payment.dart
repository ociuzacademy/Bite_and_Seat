// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/utils/u_p_i_payment_helper.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/payment_container.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';

class UPIPayment extends StatefulWidget {
  final double amount;
  final DateTime selectedDate;
  final CategoryTimeSlotModel selectedTimeSlot;
  final int numberOfPersons;
  final String selectedRoomId;
  final String selectedTableId;
  const UPIPayment({
    super.key,
    required this.amount,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPersons,
    required this.selectedRoomId,
    required this.selectedTableId,
  });

  @override
  State<UPIPayment> createState() => _UPIPaymentState();
}

class _UPIPaymentState extends State<UPIPayment> {
  late final UPIPaymentHelper _upiPaymentHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _upiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _upiPaymentHelper = UPIPaymentHelper(
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
    _upiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            key: _formKey,
            child: TextFormField(
              controller: _upiController,
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
