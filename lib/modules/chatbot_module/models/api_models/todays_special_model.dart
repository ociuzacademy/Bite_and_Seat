// To parse this JSON data, do
//
//     final todaysSpecialModel = todaysSpecialModelFromJson(jsonString);

import 'dart:convert';

List<TodaysSpecialModel> todaysSpecialModelFromJson(String str) =>
    List<TodaysSpecialModel>.from(
      json.decode(str).map((x) => TodaysSpecialModel.fromJson(x)),
    );

String todaysSpecialModelToJson(List<TodaysSpecialModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodaysSpecialModel {
  final int id;
  final String name;
  final String? image;
  final String rate;
  final String itemPerPlate;
  final int category;
  final String categoryName;
  final bool isTodaysSpecial;

  TodaysSpecialModel({
    required this.id,
    required this.name,
    this.image,
    required this.rate,
    required this.itemPerPlate,
    required this.category,
    required this.categoryName,
    required this.isTodaysSpecial,
  });

  TodaysSpecialModel copyWith({
    int? id,
    String? name,
    String? image,
    String? rate,
    String? itemPerPlate,
    int? category,
    String? categoryName,
    bool? isTodaysSpecial,
  }) => TodaysSpecialModel(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    rate: rate ?? this.rate,
    itemPerPlate: itemPerPlate ?? this.itemPerPlate,
    category: category ?? this.category,
    categoryName: categoryName ?? this.categoryName,
    isTodaysSpecial: isTodaysSpecial ?? this.isTodaysSpecial,
  );

  factory TodaysSpecialModel.fromJson(Map<String, dynamic> json) =>
      TodaysSpecialModel(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        rate: json['rate'],
        itemPerPlate: json['item_per_plate'],
        category: json['category'],
        categoryName: json['category_name'],
        isTodaysSpecial: json['is_todays_special'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rate': rate,
    'item_per_plate': itemPerPlate,
    'category': category,
    'category_name': categoryName,
    'is_todays_special': isTodaysSpecial,
  };
}
