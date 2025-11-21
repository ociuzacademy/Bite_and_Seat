// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/modules/booking_module/providers/booking_state_provider.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/booking_page_body.dart';

class BookingPage extends StatelessWidget {
  final int orderId;
  const BookingPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingStateProvider(),
      child: BookingPageBody(orderId: orderId),
    );
  }

  static MaterialPageRoute route({required int orderId}) =>
      MaterialPageRoute(builder: (context) => BookingPage(orderId: orderId));
}
