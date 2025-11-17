// To parse this JSON data, do
//
//     final dailyMenuModel = dailyMenuModelFromJson(jsonString);

import 'dart:convert';

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
  final String rate;
  final String itemPerPlate;
  final String image;
  final String category;

  const Item({
    required this.id,
    required this.name,
    required this.rate,
    required this.itemPerPlate,
    required this.image,
    required this.category,
  });

  Item copyWith({
    int? id,
    String? name,
    String? rate,
    String? itemPerPlate,
    String? image,
    String? category,
  }) => Item(
    id: id ?? this.id,
    name: name ?? this.name,
    rate: rate ?? this.rate,
    itemPerPlate: itemPerPlate ?? this.itemPerPlate,
    image: image ?? this.image,
    category: category ?? this.category,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'],
    name: json['name'],
    rate: json['rate'],
    itemPerPlate: json['item_per_plate'],
    image: json['image'],
    category: json['category'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rate': rate,
    'item_per_plate': itemPerPlate,
    'image': image,
    'category': category,
  };
}
