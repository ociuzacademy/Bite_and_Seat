// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';

class QRCodePage extends StatelessWidget {
  final DateTime selectedDate;
  final CategoryTimeSlotModel selectedTimeSlot;
  final int numberOfPersons;
  final String selectedRoomId;
  final String selectedTableId;
  final double totalRate;

  const QRCodePage({
    super.key,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPersons,
    required this.selectedRoomId,
    required this.selectedTableId,
    required this.totalRate,
  });

  static route({
    required DateTime selectedDate,
    required CategoryTimeSlotModel selectedTimeSlot,
    required int numberOfPersons,
    required String selectedRoomId,
    required String selectedTableId,
    required double totalRate,
  }) => MaterialPageRoute(
    builder: (context) => QRCodePage(
      selectedDate: selectedDate,
      selectedTimeSlot: selectedTimeSlot,
      numberOfPersons: numberOfPersons,
      selectedRoomId: selectedRoomId,
      selectedTableId: selectedTableId,
      totalRate: totalRate,
    ),
  );

  @override
  Widget build(BuildContext context) {
    // Data to encode in QR
    final qrData = {
      'date': selectedDate.toIso8601String(),
      'startTime': selectedTimeSlot.startTime,
      'endTime': selectedTimeSlot.endTime,
      'persons': numberOfPersons,
      'roomId': selectedRoomId,
      'tableId': selectedTableId,
      'totalRate': totalRate,
    };

    final qrCode = QrCode.fromData(
      data: qrData.toString(),
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Booking QR Code'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 250,
                height: 250,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppPalette.blackColor, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PrettyQrView(
                  qrImage: QrImage(qrCode),
                  decoration: const PrettyQrDecoration(
                    shape: PrettyQrSmoothSymbol(),
                    background: Colors.white,
                    // color: Colors.black,
                  ),
                  // size: 250,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Scan this QR at the canteen',
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MenuPage.route(),
                  (route) => false,
                );
              },
              child: Text(
                'HOME',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppPalette.firstColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
