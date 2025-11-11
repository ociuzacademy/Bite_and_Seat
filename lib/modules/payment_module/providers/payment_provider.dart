// ignore_for_file: public_member_api_docs, sort_constructors_first
// payment_provider.dart
import 'package:bite_and_seat/modules/payment_module/classes/card_data.dart';
import 'package:bite_and_seat/modules/payment_module/classes/payment_data.dart';
import 'package:bite_and_seat/modules/payment_module/classes/u_p_i_data.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/payment_module/enums/payment_method.dart';

class PaymentProvider with ChangeNotifier {
  // Order ID
  final int orderId;

  PaymentProvider({required this.orderId});

  // Payment state
  PaymentMethod? _selectedPaymentMethod;

  // Form controllers (will be initialized when needed)
  TextEditingController? _cardNameController;
  TextEditingController? _cardNumberController;
  TextEditingController? _expiryDateController;
  TextEditingController? _cvvController;
  TextEditingController? _upiController;

  // Form keys
  final GlobalKey<FormState> _cardFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _upiFormKey = GlobalKey<FormState>();

  // Getters
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;
  GlobalKey<FormState> get cardFormKey => _cardFormKey;
  GlobalKey<FormState> get upiFormKey => _upiFormKey;

  // Controller getters with lazy initialization
  TextEditingController get cardNameController {
    _cardNameController ??= TextEditingController();
    return _cardNameController!;
  }

  TextEditingController get cardNumberController {
    _cardNumberController ??= TextEditingController();
    return _cardNumberController!;
  }

  TextEditingController get expiryDateController {
    _expiryDateController ??= TextEditingController();
    return _expiryDateController!;
  }

  TextEditingController get cvvController {
    _cvvController ??= TextEditingController();
    return _cvvController!;
  }

  TextEditingController get upiController {
    _upiController ??= TextEditingController();
    return _upiController!;
  }

  // Methods
  void setPaymentMethod(PaymentMethod method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }

  void clearFormData() {
    _cardNameController?.clear();
    _cardNumberController?.clear();
    _expiryDateController?.clear();
    _cvvController?.clear();
    _upiController?.clear();
    _cardFormKey.currentState?.reset();
    _upiFormKey.currentState?.reset();
  }

  void disposeControllers() {
    _cardNameController?.dispose();
    _cardNumberController?.dispose();
    _expiryDateController?.dispose();
    _cvvController?.dispose();
    _upiController?.dispose();
  }

  UPIData? validateUpiData() {
    final String upiId = _upiController!.text.trim();
    if (upiId.isEmpty) {
      return null;
    }
    return UPIData(
      paymentData: PaymentData(
        orderId: orderId,
        paymentMethod: _selectedPaymentMethod!,
      ),
      upiId: upiId,
    );
  }

  CardData? validateCardData() {
    final String cardholderName = _cardNameController!.text.trim();
    if (cardholderName.isEmpty) {
      return null;
    }

    final String cardNumber = _cardNumberController!.text.trim();
    if (cardNumber.isEmpty) {
      return null;
    }

    final String expiryDate = _expiryDateController!.text.trim();
    if (expiryDate.isEmpty) {
      return null;
    }

    final String cvvNumber = _cvvController!.text.trim();
    if (cvvNumber.isEmpty) {
      return null;
    }

    return CardData(
      paymentData: PaymentData(
        orderId: orderId,
        paymentMethod: _selectedPaymentMethod!,
      ),
      cardholderName: cardholderName,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvvNumber: cvvNumber,
    );
  }
}
