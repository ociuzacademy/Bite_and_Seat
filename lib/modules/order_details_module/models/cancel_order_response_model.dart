// To parse this JSON data, do
//
//     final cancelOrderResponseModel = cancelOrderResponseModelFromJson(jsonString);

import 'dart:convert';

CancelOrderResponseModel cancelOrderResponseModelFromJson(String str) =>
    CancelOrderResponseModel.fromJson(json.decode(str));

String cancelOrderResponseModelToJson(CancelOrderResponseModel data) =>
    json.encode(data.toJson());

class CancelOrderResponseModel {
  final String message;
  final String status;
  final int seatsFreed;

  const CancelOrderResponseModel({
    required this.message,
    required this.status,
    required this.seatsFreed,
  });

  CancelOrderResponseModel copyWith({
    String? message,
    String? status,
    int? seatsFreed,
  }) => CancelOrderResponseModel(
    message: message ?? this.message,
    status: status ?? this.status,
    seatsFreed: seatsFreed ?? this.seatsFreed,
  );

  factory CancelOrderResponseModel.fromJson(Map<String, dynamic> json) =>
      CancelOrderResponseModel(
        message: json['message'],
        status: json['status'],
        seatsFreed: json['seats_freed'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'seats_freed': seatsFreed,
  };
}
