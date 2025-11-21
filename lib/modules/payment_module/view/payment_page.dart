// ignore_for_file: public_member_api_docs, sort_constructors_first
// payment_page.dart
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:bite_and_seat/modules/payment_module/utils/payment_helper.dart';
import 'package:bite_and_seat/modules/payment_module/widgets/payment_page_content.dart';
import 'package:bite_and_seat/modules/qr_code_module/view/q_r_code_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

// payment_page.dart
class PaymentPage extends StatefulWidget {
  final int orderId;
  final double totalRate;
  const PaymentPage({
    super.key,
    required this.orderId,
    required this.totalRate,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();

  static MaterialPageRoute route({required int orderId, required double totalRate}) =>
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => PaymentProvider(orderId: orderId),
          child: PaymentPage(orderId: orderId, totalRate: totalRate),
        ),
      );
}

class _PaymentPageState extends State<PaymentPage> {
  late final PaymentHelper _paymentHelper;
  late TextEditingController _pricecontroller;

  @override
  void initState() {
    super.initState();
    _paymentHelper = PaymentHelper(
      context: context,
      orderId: widget.orderId,
      totalRate: widget.totalRate,
    );
    _pricecontroller = TextEditingController(
      text: widget.totalRate.toStringAsFixed(2),
    );
  }

  @override
  void dispose() {
    _pricecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Payment Option',
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, size: 20.sp, color: Colors.black),
        ),
      ),
      body: BlocListener<PaymentBloc, PaymentState>(
        listener: (context, state) {
          switch (state) {
            case PaymentInitial _:
            case PaymentLoading _:
              OverlayLoader.show(context, message: 'Making payment...');
              break;
            case PaymentError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackbar.showError(context, message: errorMessage);
              break;
            case PaymentSuccess(:final response):
              OverlayLoader.hide();
              CustomSnackbar.showSuccess(context, message: response.message);
              Navigator.pushAndRemoveUntil(
                context,
                QRCodePage.route(orderId: response.orderId),
                (route) => false,
              );
              break;
          }
        },
        child: Consumer<PaymentProvider>(
          builder: (context, paymentProvider, child) {
            return PaymentPageContent(
              orderId: widget.orderId,
              totalRate: widget.totalRate,
              priceController: _pricecontroller,
              onOpeningPaymentContainer: _paymentHelper.makePayment,
            );
          },
        ),
      ),
    );
  }
}
