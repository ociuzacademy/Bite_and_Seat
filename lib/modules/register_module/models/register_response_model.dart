// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel {
  final String message;
  final String status;
  final int userId;

  const RegisterResponseModel({
    required this.message,
    required this.status,
    required this.userId,
  });

  RegisterResponseModel copyWith({
    String? message,
    String? status,
    int? userId,
  }) => RegisterResponseModel(
    message: message ?? this.message,
    status: status ?? this.status,
    userId: userId ?? this.userId,
  );

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        message: json['message'],
        status: json['status'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'status': status,
    'user_id': userId,
  };
}
