// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/classes/payment_data.dart';

class CardData {
  final PaymentData paymentData;
  final String cardholderName;
  final String cardNumber;
  final String expiryDate;
  final String cvvNumber;
  const CardData({
    required this.paymentData,
    required this.cardholderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvvNumber,
  });
}
