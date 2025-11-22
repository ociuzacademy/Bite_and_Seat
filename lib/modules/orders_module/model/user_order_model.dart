// To parse this JSON data, do
//
//     final userOrderModel = userOrderModelFromJson(jsonString);

import 'dart:convert';

List<UserOrderModel> userOrderModelFromJson(String str) =>
    List<UserOrderModel>.from(
      json.decode(str).map((x) => UserOrderModel.fromJson(x)),
    );

String userOrderModelToJson(List<UserOrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserOrderModel {
  final int id;
  final int userId;
  final String bookingType;
  final DateTime date;
  final int category;
  final String timeSlot;
  final int? numberOfPersons;
  final List<String> tables;
  final List<Seat> seats;
  final String totalAmount;
  final String paymentMode;
  final List<Item> items;
  final DateTime createdAt;

  const UserOrderModel({
    required this.id,
    required this.userId,
    required this.bookingType,
    required this.date,
    required this.category,
    required this.timeSlot,
    required this.numberOfPersons,
    required this.tables,
    required this.seats,
    required this.totalAmount,
    required this.paymentMode,
    required this.items,
    required this.createdAt,
  });

  UserOrderModel copyWith({
    int? id,
    int? userId,
    String? bookingType,
    DateTime? date,
    int? category,
    String? timeSlot,
    int? numberOfPersons,
    List<String>? tables,
    List<Seat>? seats,
    String? totalAmount,
    String? paymentMode,
    List<Item>? items,
    DateTime? createdAt,
  }) => UserOrderModel(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    bookingType: bookingType ?? this.bookingType,
    date: date ?? this.date,
    category: category ?? this.category,
    timeSlot: timeSlot ?? this.timeSlot,
    numberOfPersons: numberOfPersons ?? this.numberOfPersons,
    tables: tables ?? this.tables,
    seats: seats ?? this.seats,
    totalAmount: totalAmount ?? this.totalAmount,
    paymentMode: paymentMode ?? this.paymentMode,
    items: items ?? this.items,
    createdAt: createdAt ?? this.createdAt,
  );

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
    id: json['id'],
    userId: json['user_id'],
    bookingType: json['booking_type'],
    date: DateTime.parse(json['date']),
    category: json['category'],
    timeSlot: json['time_slot'],
    numberOfPersons: json['number_of_persons'],
    tables: List<String>.from(json['tables'].map((x) => x)),
    seats: List<Seat>.from(json['seats'].map((x) => Seat.fromJson(x))),
    totalAmount: json['total_amount'],
    paymentMode: json['payment_mode'],
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'booking_type': bookingType,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'category': category,
    'time_slot': timeSlot,
    'number_of_persons': numberOfPersons,
    'tables': List<dynamic>.from(tables.map((x) => x)),
    'seats': List<dynamic>.from(seats.map((x) => x.toJson())),
    'total_amount': totalAmount,
    'payment_mode': paymentMode,
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
    'created_at': createdAt.toIso8601String(),
  };
}

class Item {
  final String foodName;
  final int quantity;
  final String price;
  final String totalPrice;

  const Item({
    required this.foodName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  Item copyWith({
    String? foodName,
    int? quantity,
    String? price,
    String? totalPrice,
  }) => Item(
    foodName: foodName ?? this.foodName,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    totalPrice: totalPrice ?? this.totalPrice,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    foodName: json['food_name'],
    quantity: json['quantity'],
    price: json['price'],
    totalPrice: json['total_price'],
  );

  Map<String, dynamic> toJson() => {
    'food_name': foodName,
    'quantity': quantity,
    'price': price,
    'total_price': totalPrice,
  };
}

class Seat {
  final int seatNumber;
  final String seatPrice;
  final String tableName;

  const Seat({
    required this.seatNumber,
    required this.seatPrice,
    required this.tableName,
  });

  Seat copyWith({int? seatNumber, String? seatPrice, String? tableName}) =>
      Seat(
        seatNumber: seatNumber ?? this.seatNumber,
        seatPrice: seatPrice ?? this.seatPrice,
        tableName: tableName ?? this.tableName,
      );

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
    seatNumber: json['seat_number'],
    seatPrice: json['seat_price'],
    tableName: json['table_name'],
  );

  Map<String, dynamic> toJson() => {
    'seat_number': seatNumber,
    'seat_price': seatPrice,
    'table_name': tableName,
  };
}
