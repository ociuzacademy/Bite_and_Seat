// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/classes/payment_data.dart';

class UPIData {
  final PaymentData paymentData;
  final String upiId;
  const UPIData({required this.paymentData, required this.upiId});
}
