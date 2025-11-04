// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BookingPage2 extends StatelessWidget {
  final int bookingId;
  const BookingPage2({super.key, required this.bookingId});

  static route({required int bookingId}) => BookingPage2(bookingId: bookingId);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
