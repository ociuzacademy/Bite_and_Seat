// To parse this JSON data, do
//
//     final userOrderModel = userOrderModelFromJson(jsonString);

import 'dart:convert';

import 'package:bite_and_seat/core/enums/booking_type.dart';
import 'package:bite_and_seat/core/enums/payment_method.dart';

List<UserOrderModel> userOrderModelFromJson(String str) =>
    List<UserOrderModel>.from(
      json.decode(str).map((x) => UserOrderModel.fromJson(x)),
    );

String userOrderModelToJson(List<UserOrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserOrderModel {
  final int id;
  final int userId;
  final BookingType bookingType;
  final DateTime date;
  final int category;
  final String timeSlot;
  final int? numberOfPersons;
  final List<String> tables;
  final List<Seat> seats;
  final String totalAmount;
  final List<Item> items;
  final PaymentMethod tablePaymentMode;
  final PaymentMethod foodPaymentMode;
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
    required this.items,
    required this.tablePaymentMode,
    required this.foodPaymentMode,
    required this.createdAt,
  });

  UserOrderModel copyWith({
    int? id,
    int? userId,
    BookingType? bookingType,
    DateTime? date,
    int? category,
    String? timeSlot,
    int? numberOfPersons,
    List<String>? tables,
    List<Seat>? seats,
    String? totalAmount,
    List<Item>? items,
    PaymentMethod? tablePaymentMode,
    PaymentMethod? foodPaymentMode,
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
    items: items ?? this.items,
    tablePaymentMode: tablePaymentMode ?? this.tablePaymentMode,
    foodPaymentMode: foodPaymentMode ?? this.foodPaymentMode,
    createdAt: createdAt ?? this.createdAt,
  );

  factory UserOrderModel.fromJson(Map<String, dynamic> json) => UserOrderModel(
    id: json['id'],
    userId: json['user_id'],
    bookingType: BookingType.fromJson(json['booking_type']),
    date: DateTime.parse(json['date']),
    category: json['category'],
    timeSlot: json['time_slot'],
    numberOfPersons: json['number_of_persons'],
    tables: List<String>.from(json['tables'].map((x) => x)),
    seats: List<Seat>.from(json['seats'].map((x) => Seat.fromJson(x))),
    totalAmount: json['total_amount'],
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    tablePaymentMode: PaymentMethod.fromJson(json['table_payment_mode']),
    foodPaymentMode: PaymentMethod.fromJson(json['food_payment_mode']),
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'booking_type': bookingType.name,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'category': category,
    'time_slot': timeSlot,
    'number_of_persons': numberOfPersons,
    'tables': List<dynamic>.from(tables.map((x) => x)),
    'seats': List<dynamic>.from(seats.map((x) => x.toJson())),
    'total_amount': totalAmount,
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
    'table_payment_mode': tablePaymentMode.name,
    'food_payment_mode': foodPaymentMode.name,
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
