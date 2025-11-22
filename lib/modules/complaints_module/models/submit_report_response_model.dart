// To parse this JSON data, do
//
//     final submitReportResponseModel = submitReportResponseModelFromJson(jsonString);

import 'dart:convert';

SubmitReportResponseModel submitReportResponseModelFromJson(String str) =>
    SubmitReportResponseModel.fromJson(json.decode(str));

String submitReportResponseModelToJson(SubmitReportResponseModel data) =>
    json.encode(data.toJson());

class SubmitReportResponseModel {
  final int id;
  final String user;
  final String category;
  final String description;
  final DateTime createdAt;

  const SubmitReportResponseModel({
    required this.id,
    required this.user,
    required this.category,
    required this.description,
    required this.createdAt,
  });

  SubmitReportResponseModel copyWith({
    int? id,
    String? user,
    String? category,
    String? description,
    DateTime? createdAt,
  }) => SubmitReportResponseModel(
    id: id ?? this.id,
    user: user ?? this.user,
    category: category ?? this.category,
    description: description ?? this.description,
    createdAt: createdAt ?? this.createdAt,
  );

  factory SubmitReportResponseModel.fromJson(Map<String, dynamic> json) =>
      SubmitReportResponseModel(
        id: json['id'],
        user: json['user'],
        category: json['category'],
        description: json['description'],
        createdAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'category': category,
    'description': description,
    'created_at': createdAt.toIso8601String(),
  };
}
