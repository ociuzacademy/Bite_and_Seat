// ignore_for_file: public_member_api_docs, sort_constructors_first
// payment_page.dart

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/enums/payment_method.dart';
import 'package:bite_and_seat/modules/payment_module/providers/payment_provider.dart';
import 'package:bite_and_seat/widgets/buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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

// payment_page_content.dart
class _PaymentPageContentState extends State<PaymentPageContent> {
  @override
  void initState() {
    super.initState();
    // Delay the initialization to avoid setState during build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializePaymentMethod();
    });
  }

  void _initializePaymentMethod() {
    final paymentProvider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
    if (paymentProvider.selectedPaymentMethod == null) {
      paymentProvider.setPaymentMethod(PaymentMethod.upi);
    }
  }

  @override
  Widget build(BuildContext context) {
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
