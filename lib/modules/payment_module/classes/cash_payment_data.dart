// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/payment_module/classes/payment_data.dart';
import 'package:bite_and_seat/modules/payment_module/enums/booking_method.dart';

class CashPaymentData {
  final PaymentData paymentData;
  final BookingMethod bookingMethod;
  const CashPaymentData({
    required this.paymentData,
    required this.bookingMethod,
  });
}
