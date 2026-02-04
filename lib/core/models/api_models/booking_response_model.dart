// To parse this JSON data, do
//
//     final bookingResponseModel = bookingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:bite_and_seat/core/enums/booking_status_display.dart';
import 'package:bite_and_seat/core/enums/payment_method.dart';
import 'package:bite_and_seat/core/enums/payment_status.dart';

BookingResponseModel bookingResponseModelFromJson(String str) =>
    BookingResponseModel.fromJson(json.decode(str));

String bookingResponseModelToJson(BookingResponseModel data) =>
    json.encode(data.toJson());

class BookingResponseModel {
  final String message;
  final Order order;

  const BookingResponseModel({required this.message, required this.order});

  BookingResponseModel copyWith({String? message, Order? order}) =>
      BookingResponseModel(
        message: message ?? this.message,
        order: order ?? this.order,
      );

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) =>
      BookingResponseModel(
        message: json['message'],
        order: Order.fromJson(json['order']),
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'order': order.toJson(),
  };
}

class Order {
  final int id;
  final List<Item> items;
  final List<OrderSeat> orderSeats;
  final int? timeSlotId;
  final String? slotStartTime;
  final String? slotEndTime;
  final String? slotCategoryName;
  final String? outsiderName;
  final String? outsiderPhone;
  final String bookingType;
  final DateTime date;
  final int? numberOfPersons;
  final List<Table> tables;
  final String tableCharge;
  final String totalAmount;
  final PaymentMethod tablePaymentMode;
  final PaymentMethod foodPaymentMode;
  final PaymentStatus tablePaymentStatus;
  final PaymentStatus foodPaymentStatus;
  final bool isCompleted;
  final DateTime createdAt;
  final int user;
  final int category;
  final int? timeSlot;
  final BookingStatusDisplay status;

  const Order({
    required this.id,
    required this.items,
    required this.orderSeats,
    this.timeSlotId,
    this.slotStartTime,
    this.slotEndTime,
    this.slotCategoryName,
    this.outsiderName,
    this.outsiderPhone,
    required this.bookingType,
    required this.date,
    this.numberOfPersons,
    required this.tables,
    required this.tableCharge,
    required this.totalAmount,
    required this.tablePaymentMode,
    required this.foodPaymentMode,
    required this.tablePaymentStatus,
    required this.foodPaymentStatus,
    required this.isCompleted,
    required this.createdAt,
    required this.user,
    required this.category,
    this.timeSlot,
    required this.status,
  });

  Order copyWith({
    int? id,
    List<Item>? items,
    List<OrderSeat>? orderSeats,
    int? timeSlotId,
    String? slotStartTime,
    String? slotEndTime,
    String? slotCategoryName,
    String? outsiderName,
    String? outsiderPhone,
    String? bookingType,
    DateTime? date,
    int? numberOfPersons,
    List<Table>? tables,
    String? tableCharge,
    String? totalAmount,
    PaymentMethod? tablePaymentMode,
    PaymentMethod? foodPaymentMode,
    PaymentStatus? tablePaymentStatus,
    PaymentStatus? foodPaymentStatus,
    bool? isCompleted,
    DateTime? createdAt,
    int? user,
    int? category,
    int? timeSlot,
    BookingStatusDisplay? status,
  }) => Order(
    id: id ?? this.id,
    items: items ?? this.items,
    orderSeats: orderSeats ?? this.orderSeats,
    timeSlotId: timeSlotId ?? this.timeSlotId,
    slotStartTime: slotStartTime ?? this.slotStartTime,
    slotEndTime: slotEndTime ?? this.slotEndTime,
    slotCategoryName: slotCategoryName ?? this.slotCategoryName,
    outsiderName: outsiderName ?? this.outsiderName,
    outsiderPhone: outsiderPhone ?? this.outsiderPhone,
    bookingType: bookingType ?? this.bookingType,
    date: date ?? this.date,
    numberOfPersons: numberOfPersons ?? this.numberOfPersons,
    tables: tables ?? this.tables,
    tableCharge: tableCharge ?? this.tableCharge,
    totalAmount: totalAmount ?? this.totalAmount,
    tablePaymentMode: tablePaymentMode ?? this.tablePaymentMode,
    foodPaymentMode: foodPaymentMode ?? this.foodPaymentMode,
    tablePaymentStatus: tablePaymentStatus ?? this.tablePaymentStatus,
    foodPaymentStatus: foodPaymentStatus ?? this.foodPaymentStatus,
    isCompleted: isCompleted ?? this.isCompleted,
    createdAt: createdAt ?? this.createdAt,
    user: user ?? this.user,
    category: category ?? this.category,
    timeSlot: timeSlot ?? this.timeSlot,
    status: status ?? this.status,
  );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
    orderSeats: List<OrderSeat>.from(
      json['order_seats'].map((x) => OrderSeat.fromJson(x)),
    ),
    timeSlotId: json['time_slot_id'],
    slotStartTime: json['slot_start_time'],
    slotEndTime: json['slot_end_time'],
    slotCategoryName: json['slot_category_name'],
    outsiderName: json['outsider_name'],
    outsiderPhone: json['outsider_phone'],
    bookingType: json['booking_type'],
    date: DateTime.parse(json['date']),
    numberOfPersons: json['number_of_persons'],
    tables: List<Table>.from(json['tables'].map((x) => Table.fromJson(x))),
    tableCharge: json['table_charge'],
    totalAmount: json['total_amount'],
    tablePaymentMode: PaymentMethod.fromJson(json['table_payment_mode']),
    foodPaymentMode: PaymentMethod.fromJson(json['food_payment_mode']),
    tablePaymentStatus: PaymentStatus.fromJson(json['table_payment_status']),
    foodPaymentStatus: PaymentStatus.fromJson(json['food_payment_status']),
    isCompleted: json['is_completed'],
    createdAt: DateTime.parse(json['created_at']),
    user: json['user'],
    category: json['category'],
    timeSlot: json['time_slot'],
    status: BookingStatusDisplay.fromJson(json['status']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
    'order_seats': List<dynamic>.from(orderSeats.map((x) => x.toJson())),
    'time_slot_id': timeSlotId,
    'slot_start_time': slotStartTime,
    'slot_end_time': slotEndTime,
    'slot_category_name': slotCategoryName,
    'outsider_name': outsiderName,
    'outsider_phone': outsiderPhone,
    'booking_type': bookingType,
    'date':
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    'number_of_persons': numberOfPersons,
    'tables': List<dynamic>.from(tables.map((x) => x.toJson())),
    'table_charge': tableCharge,
    'total_amount': totalAmount,
    'table_payment_mode': tablePaymentMode.toJson(),
    'food_payment_mode': foodPaymentMode.toJson(),
    'table_payment_status': tablePaymentStatus.toJson(),
    'food_payment_status': foodPaymentStatus.toJson(),
    'is_completed': isCompleted,
    'created_at': createdAt.toIso8601String(),
    'user': user,
    'category': category,
    'time_slot': timeSlot,
    'status': status.toJson(),
  };
}

class Item {
  final int id;
  final int foodItem;
  final String foodItemName;
  final int quantity;
  final String price;
  final String totalPrice;
  final bool isTodaysSpecial;

  const Item({
    required this.id,
    required this.foodItem,
    required this.foodItemName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.isTodaysSpecial,
  });

  Item copyWith({
    int? id,
    int? foodItem,
    String? foodItemName,
    int? quantity,
    String? price,
    String? totalPrice,
    bool? isTodaysSpecial,
  }) => Item(
    id: id ?? this.id,
    foodItem: foodItem ?? this.foodItem,
    foodItemName: foodItemName ?? this.foodItemName,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    totalPrice: totalPrice ?? this.totalPrice,
    isTodaysSpecial: isTodaysSpecial ?? this.isTodaysSpecial,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json['id'],
    foodItem: json['food_item'],
    foodItemName: json['food_item_name'],
    quantity: json['quantity'],
    price: json['price'],
    totalPrice: json['total_price'],
    isTodaysSpecial: json['is_todays_special'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'food_item': foodItem,
    'food_item_name': foodItemName,
    'quantity': quantity,
    'price': price,
    'total_price': totalPrice,
    'is_todays_special': isTodaysSpecial,
  };
}

class OrderSeat {
  final int id;
  final Seat seat;

  const OrderSeat({required this.id, required this.seat});

  OrderSeat copyWith({int? id, Seat? seat}) =>
      OrderSeat(id: id ?? this.id, seat: seat ?? this.seat);

  factory OrderSeat.fromJson(Map<String, dynamic> json) =>
      OrderSeat(id: json['id'], seat: Seat.fromJson(json['seat']));

  Map<String, dynamic> toJson() => {'id': id, 'seat': seat.toJson()};
}

class Seat {
  final int id;
  final int seatNumber;
  final String seatPrice;
  final bool isOccupied;
  final int table;

  const Seat({
    required this.id,
    required this.seatNumber,
    required this.seatPrice,
    required this.isOccupied,
    required this.table,
  });

  Seat copyWith({
    int? id,
    int? seatNumber,
    String? seatPrice,
    bool? isOccupied,
    int? table,
  }) => Seat(
    id: id ?? this.id,
    seatNumber: seatNumber ?? this.seatNumber,
    seatPrice: seatPrice ?? this.seatPrice,
    isOccupied: isOccupied ?? this.isOccupied,
    table: table ?? this.table,
  );

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
    id: json['id'],
    seatNumber: json['seat_number'],
    seatPrice: json['seat_price'],
    isOccupied: json['is_occupied'],
    table: json['table'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'seat_number': seatNumber,
    'seat_price': seatPrice,
    'is_occupied': isOccupied,
    'table': table,
  };
}

class Table {
  final String tableId;
  final List<String> seatIds;

  const Table({required this.tableId, required this.seatIds});

  Table copyWith({String? tableId, List<String>? seatIds}) =>
      Table(tableId: tableId ?? this.tableId, seatIds: seatIds ?? this.seatIds);

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    tableId: json['table_id'],
    seatIds: List<String>.from(json['seat_ids'].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    'table_id': tableId,
    'seat_ids': List<dynamic>.from(seatIds.map((x) => x)),
  };
}
