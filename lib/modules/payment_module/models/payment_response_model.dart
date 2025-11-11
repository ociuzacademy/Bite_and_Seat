// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import 'dart:convert';

PaymentResponseModel paymentResponseModelFromJson(String str) =>
    PaymentResponseModel.fromJson(json.decode(str));

String paymentResponseModelToJson(PaymentResponseModel data) =>
    json.encode(data.toJson());

class PaymentResponseModel {
  final String message;
  final int orderId;
  final String updatedPaymentMode;
  final PaymentDetails paymentDetails;

  const PaymentResponseModel({
    required this.message,
    required this.orderId,
    required this.updatedPaymentMode,
    required this.paymentDetails,
  });

  PaymentResponseModel copyWith({
    String? message,
    int? orderId,
    String? updatedPaymentMode,
    PaymentDetails? paymentDetails,
  }) => PaymentResponseModel(
    message: message ?? this.message,
    orderId: orderId ?? this.orderId,
    updatedPaymentMode: updatedPaymentMode ?? this.updatedPaymentMode,
    paymentDetails: paymentDetails ?? this.paymentDetails,
  );

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        message: json['message'],
        orderId: json['order_id'],
        updatedPaymentMode: json['updated_payment_mode'],
        paymentDetails: PaymentDetails.fromJson(json['payment_details']),
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'order_id': orderId,
    'updated_payment_mode': updatedPaymentMode,
    'payment_details': paymentDetails.toJson(),
  };
}

class PaymentDetails {
  final String paymentMethod;
  final String paymentStatus;
  final DateTime paymentDate;

  const PaymentDetails({
    required this.paymentMethod,
    required this.paymentStatus,
    required this.paymentDate,
  });

  PaymentDetails copyWith({
    String? paymentMethod,
    String? paymentStatus,
    DateTime? paymentDate,
  }) => PaymentDetails(
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    paymentDate: paymentDate ?? this.paymentDate,
  );

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
    paymentMethod: json['payment_method'],
    paymentStatus: json['payment_status'],
    paymentDate: DateTime.parse(json['payment_date']),
  );

  Map<String, dynamic> toJson() => {
    'payment_method': paymentMethod,
    'payment_status': paymentStatus,
    'payment_date': paymentDate.toIso8601String(),
  };
}
