// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/core/enums/payment_method.dart';

class PaymentData {
  final int orderId;
  final PaymentMethod paymentMethod;
  const PaymentData({required this.orderId, required this.paymentMethod});
}
