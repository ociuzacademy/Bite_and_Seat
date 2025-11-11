// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/menu_module/view/menu_page.dart';

class QRCodePage extends StatelessWidget {
  final int orderId;

  const QRCodePage({super.key, required this.orderId});

  static route({required int orderId}) =>
      MaterialPageRoute(builder: (context) => QRCodePage(orderId: orderId));

  @override
  Widget build(BuildContext context) {
    // Data to encode in QR
    final qrData = {'order_id': orderId};

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
