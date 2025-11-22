// To parse this JSON data, do
//
//     final submitFeedbackResponseModel = submitFeedbackResponseModelFromJson(jsonString);

import 'dart:convert';

SubmitFeedbackResponseModel submitFeedbackResponseModelFromJson(String str) =>
    SubmitFeedbackResponseModel.fromJson(json.decode(str));

String submitFeedbackResponseModelToJson(SubmitFeedbackResponseModel data) =>
    json.encode(data.toJson());

class SubmitFeedbackResponseModel {
  final String message;

  const SubmitFeedbackResponseModel({required this.message});

  SubmitFeedbackResponseModel copyWith({String? message}) =>
      SubmitFeedbackResponseModel(message: message ?? this.message);

  factory SubmitFeedbackResponseModel.fromJson(Map<String, dynamic> json) =>
      SubmitFeedbackResponseModel(message: json['message']);

  Map<String, dynamic> toJson() => {'message': message};
}
