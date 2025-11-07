// To parse this JSON data, do
//
//     final categoryTimeSlotModel = categoryTimeSlotModelFromJson(jsonString);

import 'dart:convert';

List<CategoryTimeSlotModel> categoryTimeSlotModelFromJson(String str) =>
    List<CategoryTimeSlotModel>.from(
      json.decode(str).map((x) => CategoryTimeSlotModel.fromJson(x)),
    );

String categoryTimeSlotModelToJson(List<CategoryTimeSlotModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryTimeSlotModel {
  final int id;
  final String categoryName;
  final int categoryId;
  final String startTime;
  final String endTime;

  const CategoryTimeSlotModel({
    required this.id,
    required this.categoryName,
    required this.categoryId,
    required this.startTime,
    required this.endTime,
  });

  CategoryTimeSlotModel copyWith({
    int? id,
    String? categoryName,
    int? categoryId,
    String? startTime,
    String? endTime,
  }) => CategoryTimeSlotModel(
    id: id ?? this.id,
    categoryName: categoryName ?? this.categoryName,
    categoryId: categoryId ?? this.categoryId,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
  );

  factory CategoryTimeSlotModel.fromJson(Map<String, dynamic> json) =>
      CategoryTimeSlotModel(
        id: json['id'],
        categoryName: json['category_name'],
        categoryId: json['category_id'],
        startTime: json['start_time'],
        endTime: json['end_time'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'category_name': categoryName,
    'category_id': categoryId,
    'start_time': startTime,
    'end_time': endTime,
  };
}
