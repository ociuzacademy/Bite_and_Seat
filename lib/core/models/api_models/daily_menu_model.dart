// To parse this JSON data, do
//
//     final dailyMenuModel = dailyMenuModelFromJson(jsonString);

import 'dart:convert';

import 'package:bite_and_seat/core/enums/food_time.dart';

DailyMenuModel dailyMenuModelFromJson(String str) =>
    DailyMenuModel.fromJson(json.decode(str));

String dailyMenuModelToJson(DailyMenuModel data) => json.encode(data.toJson());

class DailyMenuModel {
  final int id;
  final DateTime date;
  final List<Item> items;

  const DailyMenuModel({
    required this.id,
    required this.date,
    required this.items,
  });

  DailyMenuModel copyWith({int? id, DateTime? date, List<Item>? items}) =>
      DailyMenuModel(
        id: id ?? this.id,
        date: date ?? this.date,
        items: items ?? this.items,
      );

  factory DailyMenuModel.fromJson(Map<String, dynamic> json) => DailyMenuModel(
    id: json['id'],
    date: DateTime.parse(json['date']),
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  final int id;
  final String name;
  final String image;
  final String rate;
  final String itemPerPlate;
  final Category category;
  final String itemSource;

  const Item({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.itemPerPlate,
    required this.category,
    required this.itemSource,
  });

  Item copyWith({
    int? id,
    String? name,
    String? image,
    String? rate,
    String? itemPerPlate,
    Category? category,
    String? itemSource,
  }) => Item(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    rate: rate ?? this.rate,
    itemPerPlate: itemPerPlate ?? this.itemPerPlate,
    category: category ?? this.category,
    itemSource: itemSource ?? this.itemSource,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    rate: json['rate'],
    itemPerPlate: json['item_per_plate'],
    category: Category.fromJson(json['category']),
    itemSource: json['item_source'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rate': rate,
    'item_per_plate': itemPerPlate,
    'category': category.toJson(),
    'item_source': itemSource,
  };
}

class Category {
  final int id;
  final FoodTime name;

  const Category({required this.id, required this.name});

  Category copyWith({int? id, FoodTime? name}) =>
      Category(id: id ?? this.id, name: name ?? this.name);

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'], name: FoodTime.fromJson(json['name']));

  Map<String, dynamic> toJson() => {'id': id, 'name': name.label};
}
