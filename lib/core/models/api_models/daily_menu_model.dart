// To parse this JSON data, do
//
//     final dailyMenuModel = dailyMenuModelFromJson(jsonString);

import 'dart:convert';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/enums/item_source.dart';

DailyMenuModel dailyMenuModelFromJson(String str) =>
    DailyMenuModel.fromJson(json.decode(str));

String dailyMenuModelToJson(DailyMenuModel data) => json.encode(data.toJson());

class DailyMenuModel {
  final int id;
  final DateTime date;
  final List<Item> items;
  final List<TodaysSpecial> todaysSpecials;

  const DailyMenuModel({
    required this.id,
    required this.date,
    required this.items,
    required this.todaysSpecials,
  });

  DailyMenuModel copyWith({
    int? id,
    DateTime? date,
    List<Item>? items,
    List<TodaysSpecial>? todaysSpecials,
  }) => DailyMenuModel(
    id: id ?? this.id,
    date: date ?? this.date,
    items: items ?? this.items,
    todaysSpecials: todaysSpecials ?? this.todaysSpecials,
  );

  factory DailyMenuModel.fromJson(Map<String, dynamic> json) => DailyMenuModel(
    id: json['id'],
    date: DateTime.parse(json['date']),
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    todaysSpecials: List<TodaysSpecial>.from(
      json['todays_specials'].map((x) => TodaysSpecial.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
    'todays_specials': List<dynamic>.from(
      todaysSpecials.map((x) => x.toJson()),
    ),
  };
}

class Item {
  final int id;
  final String name;
  final String image;
  final String rate;
  final String itemPerPlate;
  final Category category;
  final bool isTodaysSpecial;
  final DateTime? specialDate;
  final dynamic todaysSpecialBookingInfo;
  final ItemSource itemSource;

  const Item({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.itemPerPlate,
    required this.category,
    required this.isTodaysSpecial,
    required this.specialDate,
    required this.todaysSpecialBookingInfo,
    required this.itemSource,
  });

  Item copyWith({
    int? id,
    String? name,
    String? image,
    String? rate,
    String? itemPerPlate,
    Category? category,
    bool? isTodaysSpecial,
    DateTime? specialDate,
    dynamic todaysSpecialBookingInfo,
    ItemSource? itemSource,
  }) => Item(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    rate: rate ?? this.rate,
    itemPerPlate: itemPerPlate ?? this.itemPerPlate,
    category: category ?? this.category,
    isTodaysSpecial: isTodaysSpecial ?? this.isTodaysSpecial,
    specialDate: specialDate ?? this.specialDate,
    todaysSpecialBookingInfo:
        todaysSpecialBookingInfo ?? this.todaysSpecialBookingInfo,
    itemSource: itemSource ?? this.itemSource,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    rate: json['rate'],
    itemPerPlate: json['item_per_plate'],
    category: Category.fromJson(json['category']),
    isTodaysSpecial: json['is_todays_special'],
    specialDate: json['special_date'] == null
        ? null
        : DateTime.parse(json['special_date']),
    todaysSpecialBookingInfo: json['todays_special_booking_info'],
    itemSource: ItemSource.fromJson(json['item_source']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rate': rate,
    'item_per_plate': itemPerPlate,
    'category': category.toJson(),
    'is_todays_special': isTodaysSpecial,
    'special_date':
        "${specialDate!.year.toString().padLeft(4, '0')}-${specialDate!.month.toString().padLeft(2, '0')}-${specialDate!.day.toString().padLeft(2, '0')}",
    'todays_special_booking_info': todaysSpecialBookingInfo,
    'item_source': itemSource.toJson(),
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

  Map<String, dynamic> toJson() => {'id': id, 'name': name.toJson()};
}

class TodaysSpecial {
  final int id;
  final String name;
  final String image;
  final String rate;
  final String itemPerPlate;
  final int category;
  final FoodTime categoryName;
  final bool isTodaysSpecial;
  final ItemSource itemSource;
  final BookingRestrictions bookingRestrictions;

  const TodaysSpecial({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.itemPerPlate,
    required this.category,
    required this.categoryName,
    required this.isTodaysSpecial,
    required this.itemSource,
    required this.bookingRestrictions,
  });

  TodaysSpecial copyWith({
    int? id,
    String? name,
    String? image,
    String? rate,
    String? itemPerPlate,
    int? category,
    FoodTime? categoryName,
    bool? isTodaysSpecial,
    ItemSource? itemSource,
    BookingRestrictions? bookingRestrictions,
  }) => TodaysSpecial(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    rate: rate ?? this.rate,
    itemPerPlate: itemPerPlate ?? this.itemPerPlate,
    category: category ?? this.category,
    categoryName: categoryName ?? this.categoryName,
    isTodaysSpecial: isTodaysSpecial ?? this.isTodaysSpecial,
    itemSource: itemSource ?? this.itemSource,
    bookingRestrictions: bookingRestrictions ?? this.bookingRestrictions,
  );

  factory TodaysSpecial.fromJson(Map<String, dynamic> json) => TodaysSpecial(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    rate: json['rate'],
    itemPerPlate: json['item_per_plate'],
    category: json['category'],
    categoryName: FoodTime.fromJson(json['category_name']),
    isTodaysSpecial: json['is_todays_special'],
    itemSource: ItemSource.fromJson(json['item_source']),
    bookingRestrictions: BookingRestrictions.fromJson(
      json['booking_restrictions'],
    ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'rate': rate,
    'item_per_plate': itemPerPlate,
    'category': category,
    'category_name': categoryName.toJson(),
    'is_todays_special': isTodaysSpecial,
    'item_source': itemSource.toJson(),
    'booking_restrictions': bookingRestrictions.toJson(),
  };
}

class BookingRestrictions {
  final bool canBeBookedByUsersPrebooked;
  final bool canBeBookedByUsersTableOnly;
  final bool canBeBookedByAdmin;
  final String message;

  const BookingRestrictions({
    required this.canBeBookedByUsersPrebooked,
    required this.canBeBookedByUsersTableOnly,
    required this.canBeBookedByAdmin,
    required this.message,
  });

  BookingRestrictions copyWith({
    bool? canBeBookedByUsersPrebooked,
    bool? canBeBookedByUsersTableOnly,
    bool? canBeBookedByAdmin,
    String? message,
  }) => BookingRestrictions(
    canBeBookedByUsersPrebooked:
        canBeBookedByUsersPrebooked ?? this.canBeBookedByUsersPrebooked,
    canBeBookedByUsersTableOnly:
        canBeBookedByUsersTableOnly ?? this.canBeBookedByUsersTableOnly,
    canBeBookedByAdmin: canBeBookedByAdmin ?? this.canBeBookedByAdmin,
    message: message ?? this.message,
  );

  factory BookingRestrictions.fromJson(Map<String, dynamic> json) =>
      BookingRestrictions(
        canBeBookedByUsersPrebooked: json['can_be_booked_by_users_prebooked'],
        canBeBookedByUsersTableOnly: json['can_be_booked_by_users_table_only'],
        canBeBookedByAdmin: json['can_be_booked_by_admin'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
    'can_be_booked_by_users_prebooked': canBeBookedByUsersPrebooked,
    'can_be_booked_by_users_table_only': canBeBookedByUsersTableOnly,
    'can_be_booked_by_admin': canBeBookedByAdmin,
    'message': message,
  };
}
