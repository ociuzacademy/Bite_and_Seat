// ignore_for_file: public_member_api_docs, sort_constructors_first
// table_booking_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/modules/table_booking_module/providers/table_booking_provider.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_booking_page_content.dart';

class TableBookingPage extends StatefulWidget {
  final int orderId;

  const TableBookingPage({super.key, required this.orderId});

  @override
  State<TableBookingPage> createState() => _TableBookingPageState();

  static route({required int orderId}) => MaterialPageRoute(
    builder: (context) => TableBookingPage(orderId: orderId),
  );
}

class _TableBookingPageState extends State<TableBookingPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TableBookingProvider(),
      child: TableBookingPageContent(orderId: widget.orderId),
    );
  }
}
