// ignore_for_file: public_member_api_docs, sort_constructors_first
// payment_page.dart
import 'package:bite_and_seat/modules/payment_module/bloc/payment/payment_bloc.dart';
import 'package:bite_and_seat/modules/qr_code_module/view/q_r_code_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/enums/payment_method.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:bite_and_seat/modules/payment_module/utils/payment_helper.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';

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

  static route({required int orderId, required double totalRate}) =>
      MaterialPageRoute(
        builder: (context) =>
            PaymentPage(orderId: orderId, totalRate: totalRate),
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

    // Wrap the entire page with ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (context) => PaymentProvider(orderId: widget.orderId),
      child: Scaffold(
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
          child: PaymentPageContent(
            orderId: widget.orderId,
            totalRate: widget.totalRate,
            priceController: _pricecontroller,
            onOpeningPaymentContainer: _paymentHelper.makePayment,
          ),
        ),
      ),
    );
  }
}

// Separate widget for the page content that can access the provider
class PaymentPageContent extends StatefulWidget {
  final int orderId;
  final double totalRate;
  final TextEditingController priceController;
  final VoidCallback onOpeningPaymentContainer;

  const PaymentPageContent({
    super.key,
    required this.orderId,
    required this.totalRate,
    required this.priceController,
    required this.onOpeningPaymentContainer,
  });

  @override
  State<PaymentPageContent> createState() => _PaymentPageContentState();
}

class _PaymentPageContentState extends State<PaymentPageContent> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    // Initialize payment method after the frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final paymentProvider = Provider.of<PaymentProvider>(
        context,
        listen: false,
      );
      if (paymentProvider.selectedPaymentMethod == null) {
        paymentProvider.setPaymentMethod(PaymentMethod.upi);
      }
      setState(() {
        _isInitialized = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: widget.priceController,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: '₹0',
            ),
            style: TextStyle(fontSize: 70.sp),
            readOnly: true,
          ),
          SizedBox(height: 20.h),
          const Spacer(),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose Your transaction method',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                      return DropdownButtonFormField<PaymentMethod>(
                        value: paymentProvider.selectedPaymentMethod,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 12.h,
                          ),
                        ),
                        items: [
                          DropdownMenuItem<PaymentMethod>(
                            value: PaymentMethod.upi,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-google-pay-48.png',
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                SizedBox(width: 10.w),
                                Text('UPI', style: TextStyle(fontSize: 14.sp)),
                              ],
                            ),
                          ),
                          DropdownMenuItem<PaymentMethod>(
                            value: PaymentMethod.card,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/icons/icons8-credit-card-48.png',
                                  width: 30.w,
                                  height: 30.h,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Credit/Debit Cards',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (PaymentMethod? newValue) {
                          paymentProvider.setPaymentMethod(newValue!);
                        },
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
                  Consumer<PaymentProvider>(
                    builder: (context, paymentProvider, child) {
                      return CustomButton(
                        buttonWidth: double.infinity,
                        backgroundColor: AppPalette.firstColor,
                        textColor: Colors.white,
                        labelText: 'Confirm Payment Method',
                        onClick: widget.onOpeningPaymentContainer,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
