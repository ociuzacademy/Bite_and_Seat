// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:bite_and_seat/core/enums/booking_type.dart';
import 'package:bite_and_seat/core/enums/payment_method.dart';

OrderDetailsModel orderDetailsModelFromJson(String str) =>
    OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) =>
    json.encode(data.toJson());

class OrderDetailsModel {
  final int id;
  final int user;
  final BookingType bookingType;
  final int category;
  final DateTime date;
  final int? timeSlot;
  final String? slotStartTime;
  final String? slotEndTime;
  final int? numberOfPersons;
  final List<Table> tables;
  final String tableCharge;
  final String totalAmount;
  final PaymentMethod tablePaymentMode;
  final PaymentMethod foodPaymentMode;
  final List<Item> items;
  final List<Payment> payments;
  final DateTime createdAt;
  final bool isCompleted;

  const OrderDetailsModel({
    required this.id,
    required this.user,
    required this.bookingType,
    required this.category,
    required this.date,
    this.timeSlot,
    this.slotStartTime,
    this.slotEndTime,
    this.numberOfPersons,
    required this.tables,
    required this.tableCharge,
    required this.totalAmount,
    required this.tablePaymentMode,
    required this.foodPaymentMode,
    required this.items,
    required this.payments,
    required this.createdAt,
    required this.isCompleted,
  });

  OrderDetailsModel copyWith({
    int? id,
    int? user,
    BookingType? bookingType,
    int? category,
    DateTime? date,
    int? timeSlot,
    String? slotStartTime,
    String? slotEndTime,
    int? numberOfPersons,
    List<Table>? tables,
    String? tableCharge,
    String? totalAmount,
    PaymentMethod? tablePaymentMode,
    PaymentMethod? foodPaymentMode,
    List<Item>? items,
    List<Payment>? payments,
    DateTime? createdAt,
    bool? isCompleted,
  }) => OrderDetailsModel(
    id: id ?? this.id,
    user: user ?? this.user,
    bookingType: bookingType ?? this.bookingType,
    category: category ?? this.category,
    date: date ?? this.date,
    timeSlot: timeSlot ?? this.timeSlot,
    slotStartTime: slotStartTime ?? this.slotStartTime,
    slotEndTime: slotEndTime ?? this.slotEndTime,
    numberOfPersons: numberOfPersons ?? this.numberOfPersons,
    tables: tables ?? this.tables,
    tableCharge: tableCharge ?? this.tableCharge,
    totalAmount: totalAmount ?? this.totalAmount,
    tablePaymentMode: tablePaymentMode ?? this.tablePaymentMode,
    foodPaymentMode: foodPaymentMode ?? this.foodPaymentMode,
    items: items ?? this.items,
    payments: payments ?? this.payments,
    createdAt: createdAt ?? this.createdAt,
    isCompleted: isCompleted ?? this.isCompleted,
  );

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderDetailsModel(
        id: json['id'],
        user: json['user'],
        bookingType: BookingType.fromJson(json['booking_type']),
        category: json['category'],
        date: DateTime.parse(json['date']),
        timeSlot: json['time_slot'],
        slotStartTime: json['slot_start_time'],
        slotEndTime: json['slot_end_time'],
        numberOfPersons: json['number_of_persons'],
        tables: List<Table>.from(json['tables'].map((x) => Table.fromJson(x))),
        tableCharge: json['table_charge'],
        totalAmount: json['total_amount'],
        tablePaymentMode: PaymentMethod.fromJson(json['table_payment_mode']),
        foodPaymentMode: PaymentMethod.fromJson(json['food_payment_mode']),
        items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
        payments: List<Payment>.from(
          json['payments'].map((x) => Payment.fromJson(x)),
        ),
        createdAt: DateTime.parse(json['created_at']),
        isCompleted: json['is_completed'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user,
    'booking_type': bookingType.label,
    'category': category,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'time_slot': timeSlot,
    'slot_start_time': slotStartTime,
    'slot_end_time': slotEndTime,
    'number_of_persons': numberOfPersons,
    'tables': List<dynamic>.from(tables.map((x) => x.toJson())),
    'table_charge': tableCharge,
    'total_amount': totalAmount,
    'table_payment_mode': tablePaymentMode.label,
    'food_payment_mode': foodPaymentMode.label,
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
    'payments': List<dynamic>.from(payments.map((x) => x.toJson())),
    'created_at': createdAt.toIso8601String(),
    'is_completed': isCompleted,
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
  final String paymentType;
  final DateTime paymentDate;
  final String? upiId;
  final String? cardholderName;
  final String? cardNumber;
  final String? expiryDate;
  final String? cvvNumber;

  const Payment({
    required this.paymentMethod,
    required this.paymentType,
    required this.paymentDate,
    this.upiId,
    this.cardholderName,
    this.cardNumber,
    this.expiryDate,
    this.cvvNumber,
  });

  Payment copyWith({
    String? paymentMethod,
    String? paymentType,
    DateTime? paymentDate,
    String? upiId,
    String? cardholderName,
    String? cardNumber,
    String? expiryDate,
    String? cvvNumber,
  }) => Payment(
    paymentMethod: paymentMethod ?? this.paymentMethod,
    paymentType: paymentType ?? this.paymentType,
    paymentDate: paymentDate ?? this.paymentDate,
    upiId: upiId ?? this.upiId,
    cardholderName: cardholderName ?? this.cardholderName,
    cardNumber: cardNumber ?? this.cardNumber,
    expiryDate: expiryDate ?? this.expiryDate,
    cvvNumber: cvvNumber ?? this.cvvNumber,
  );

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
    paymentMethod: json['payment_method'],
    paymentType: json['payment_type'],
    paymentDate: DateTime.parse(json['payment_date']),
    upiId: json['upi_id'],
    cardholderName: json['cardholder_name'],
    cardNumber: json['card_number'],
    expiryDate: json['expiry_date'],
    cvvNumber: json['cvv_number'],
  );

  Map<String, dynamic> toJson() => {
    'payment_method': paymentMethod,
    'payment_type': paymentType,
    'payment_date': paymentDate.toIso8601String(),
    'upi_id': upiId,
    'cardholder_name': cardholderName,
    'card_number': cardNumber,
    'expiry_date': expiryDate,
    'cvv_number': cvvNumber,
  };
}

class Table {
  final List<int> seatIds;
  final int tableId;

  const Table({required this.seatIds, required this.tableId});

  Table copyWith({List<int>? seatIds, int? tableId}) =>
      Table(seatIds: seatIds ?? this.seatIds, tableId: tableId ?? this.tableId);

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    seatIds: List<int>.from(
      json['seat_ids'].map((x) => int.tryParse(x.toString()) ?? 0),
    ),
    tableId: int.tryParse(json['table_id'].toString()) ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'seat_ids': List<dynamic>.from(seatIds.map((x) => x)),
    'table_id': tableId,
  };
}
