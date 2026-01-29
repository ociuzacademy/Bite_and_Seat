// To parse this JSON data, do
//
//     final paymentResponseModel = paymentResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:bite_and_seat/core/enums/payment_method.dart';
import 'package:bite_and_seat/core/enums/payment_status.dart';
import 'package:bite_and_seat/modules/payment_module/enums/booking_method.dart';

PaymentResponseModel paymentResponseModelFromJson(String str) =>
    PaymentResponseModel.fromJson(json.decode(str));

String paymentResponseModelToJson(PaymentResponseModel data) =>
    json.encode(data.toJson());

class PaymentResponseModel {
  final String status;
  final String message;
  final Data data;

  const PaymentResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  PaymentResponseModel copyWith({
    String? status,
    String? message,
    Data? data,
  }) => PaymentResponseModel(
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentResponseModel(
        status: json['status'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'data': data.toJson(),
  };
}

class Data {
  final int orderId;
  final int paymentId;
  final PaymentMethod paymentMethod;
  final BookingMethod paymentType;
  final PaymentMethod tablePaymentMode;
  final PaymentMethod foodPaymentMode;
  final PaymentStatus tablePaymentStatus;
  final PaymentStatus foodPaymentStatus;

  Data({
    required this.orderId,
    required this.paymentId,
    required this.paymentMethod,
    required this.paymentType,
    required this.tablePaymentMode,
    required this.foodPaymentMode,
    required this.tablePaymentStatus,
    required this.foodPaymentStatus,
  });

  Data copyWith({
    int? orderId,
    int? paymentId,
    PaymentMethod? paymentMethod,
    BookingMethod? paymentType,
    PaymentMethod? tablePaymentMode,
    PaymentMethod? foodPaymentMode,
    PaymentStatus? tablePaymentStatus,
    PaymentStatus? foodPaymentStatus,
  }) => Data(
    orderId: orderId ?? this.orderId,
    paymentId: paymentId ?? this.paymentId,
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentType: paymentType ?? this.paymentType,
    tablePaymentMode: tablePaymentMode ?? this.tablePaymentMode,
    foodPaymentMode: foodPaymentMode ?? this.foodPaymentMode,
    tablePaymentStatus: tablePaymentStatus ?? this.tablePaymentStatus,
    foodPaymentStatus: foodPaymentStatus ?? this.foodPaymentStatus,
  );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json['order_id'],
    paymentId: json['payment_id'],
    paymentMethod: PaymentMethod.fromJson(json['payment_method']),
    paymentType: BookingMethod.fromJson(json['payment_type']),
    tablePaymentMode: PaymentMethod.fromJson(json['table_payment_mode']),
    foodPaymentMode: PaymentMethod.fromJson(json['food_payment_mode']),
    tablePaymentStatus: PaymentStatus.fromJson(json['table_payment_status']),
    foodPaymentStatus: PaymentStatus.fromJson(json['food_payment_status']),
  );

  Map<String, dynamic> toJson() => {
    'order_id': orderId,
    'payment_id': paymentId,
    'payment_method': paymentMethod.toJson(),
    'payment_type': paymentType.toJson(),
    'table_payment_mode': tablePaymentMode.toJson(),
    'food_payment_mode': foodPaymentMode.toJson(),
    'table_payment_status': tablePaymentStatus.toJson(),
    'food_payment_status': foodPaymentStatus.toJson(),
  };
}
