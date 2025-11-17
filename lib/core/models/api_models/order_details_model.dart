// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  final int id;
  final int user;
  final String bookingType;
  final int category;
  final DateTime date;
  final int? timeSlot;
  final int? numberOfPersons;
  final List<Table> tables;
  final String tableCharge;
  final String totalAmount;
  final String paymentMode;
  final List<Item> items;
  final List<Payment> payments;
  final DateTime createdAt;

  const OrderDetailsModel({
    required this.id,
    required this.user,
    required this.bookingType,
    required this.category,
    required this.date,
    this.timeSlot,
    this.numberOfPersons,
    required this.tables,
    required this.tableCharge,
    required this.totalAmount,
    required this.paymentMode,
    required this.items,
    required this.payments,
    required this.createdAt,
  });

  OrderDetailsModel copyWith({
    int? id,
    int? user,
    String? bookingType,
    int? category,
    DateTime? date,
    int? timeSlot,
    int? numberOfPersons,
    List<Table>? tables,
    String? tableCharge,
    String? totalAmount,
    String? paymentMode,
    List<Item>? items,
    List<Payment>? payments,
    DateTime? createdAt,
  }) => OrderDetailsModel(
    id: id ?? this.id,
    user: user ?? this.user,
    bookingType: bookingType ?? this.bookingType,
    category: category ?? this.category,
    date: date ?? this.date,
    timeSlot: timeSlot ?? this.timeSlot,
    numberOfPersons: numberOfPersons ?? this.numberOfPersons,
    tables: tables ?? this.tables,
    tableCharge: tableCharge ?? this.tableCharge,
    totalAmount: totalAmount ?? this.totalAmount,
    paymentMode: paymentMode ?? this.paymentMode,
    items: items ?? this.items,
    payments: payments ?? this.payments,
    createdAt: createdAt ?? this.createdAt,
  );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json['id'],
        user: json['user'],
        bookingType: json['booking_type'],
        category: json['category'],
        date: DateTime.parse(json['date']),
        timeSlot: json['time_slot'],
        numberOfPersons: json['number_of_persons'],
        tables: List<Table>.from(json['tables'].map((x) => Table.fromJson(x))),
        tableCharge: json['table_charge'],
        totalAmount: json['total_amount'],
        paymentMode: json['payment_mode'],
        items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
        payments: List<Payment>.from(
          json['payments'].map((x) => Payment.fromJson(x)),
        ),
        createdAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'booking_type': bookingType,
    'category': category,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'time_slot': timeSlot,
    'number_of_persons': numberOfPersons,
    'tables': List<dynamic>.from(tables.map((x) => x.toJson())),
    'table_charge': tableCharge,
    'total_amount': totalAmount,
    'payment_mode': paymentMode,
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
    'payments': List<dynamic>.from(payments.map((x) => x.toJson())),
    'created_at': createdAt.toIso8601String(),
  };
}

class Item {
  final int foodItemId;
  final String foodItemName;
  final int quantity;
  final String price;
  final String totalPrice;

  const Item({
    required this.foodItemId,
    required this.foodItemName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  Item copyWith({
    int? foodItemId,
    String? foodItemName,
    int? quantity,
    String? price,
    String? totalPrice,
  }) => Item(
    foodItemId: foodItemId ?? this.foodItemId,
    foodItemName: foodItemName ?? this.foodItemName,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    totalPrice: totalPrice ?? this.totalPrice,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    foodItemId: json['food_item_id'],
    foodItemName: json['food_item_name'],
    quantity: json['quantity'],
    price: json['price'],
    totalPrice: json['total_price'],
  );

  Map<String, dynamic> toJson() => {
    'food_item_id': foodItemId,
    'food_item_name': foodItemName,
    'quantity': quantity,
    'price': price,
    'total_price': totalPrice,
  };
}

class Payment {
  final String paymentMethod;
  final String paymentStatus;
  final DateTime paymentDate;

  const Payment({
    required this.paymentMethod,
    required this.paymentStatus,
    required this.paymentDate,
  });

  Payment copyWith({
    String? paymentMethod,
    String? paymentStatus,
    DateTime? paymentDate,
  }) => Payment(
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentStatus: paymentStatus ?? this.paymentStatus,
    paymentDate: paymentDate ?? this.paymentDate,
  );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    paymentMethod: json['payment_method'],
    paymentStatus: json['payment_status'],
    paymentDate: DateTime.parse(json['payment_date']),
  );

  Map<String, dynamic> toJson() => {
    'payment_method': paymentMethod,
    'payment_status': paymentStatus,
    'payment_date': paymentDate.toIso8601String(),
  };
}

class Table {
  final List<int> seatIds;
  final int tableId;

  const Table({required this.seatIds, required this.tableId});

  Table copyWith({List<int>? seatIds, int? tableId}) =>
      Table(seatIds: seatIds ?? this.seatIds, tableId: tableId ?? this.tableId);

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    seatIds: List<int>.from(json['seat_ids'].map((x) => x)),
    tableId: json['table_id'],
  );

  Map<String, dynamic> toJson() => {
    'seat_ids': List<dynamic>.from(seatIds.map((x) => x)),
    'table_id': tableId,
  };
}
