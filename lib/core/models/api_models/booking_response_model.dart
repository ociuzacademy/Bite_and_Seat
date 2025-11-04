// To parse this JSON data, do
//
//     final bookingResponseModel = bookingResponseModelFromJson(jsonString);

import 'dart:convert';

BookingResponseModel bookingResponseModelFromJson(String str) =>
    BookingResponseModel.fromJson(json.decode(str));

String bookingResponseModelToJson(BookingResponseModel data) =>
    json.encode(data.toJson());

class BookingResponseModel {
  final String message;
  final Order order;

  BookingResponseModel({required this.message, required this.order});

  BookingResponseModel copyWith({String? message, Order? order}) =>
      BookingResponseModel(
        message: message ?? this.message,
        order: order ?? this.order,
      );

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) =>
      BookingResponseModel(
        message: json["message"],
        order: Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "order": order.toJson(),
  };
}

class Order {
  final int id;
  final List<Item> items;
  final List<OrderSeat> orderSeats;
  final String bookingType;
  final DateTime date;
  final String timeSlot;
  final int numberOfPersons;
  final List<Table> tables;
  final String tableCharge;
  final String totalAmount;
  final String paymentMode;
  final DateTime createdAt;
  final int user;
  final int category;

  Order({
    required this.id,
    required this.items,
    required this.orderSeats,
    required this.bookingType,
    required this.date,
    required this.timeSlot,
    required this.numberOfPersons,
    required this.tables,
    required this.tableCharge,
    required this.totalAmount,
    required this.paymentMode,
    required this.createdAt,
    required this.user,
    required this.category,
  });

  Order copyWith({
    int? id,
    List<Item>? items,
    List<OrderSeat>? orderSeats,
    String? bookingType,
    DateTime? date,
    String? timeSlot,
    int? numberOfPersons,
    List<Table>? tables,
    String? tableCharge,
    String? totalAmount,
    String? paymentMode,
    DateTime? createdAt,
    int? user,
    int? category,
  }) => Order(
    id: id ?? this.id,
    items: items ?? this.items,
    orderSeats: orderSeats ?? this.orderSeats,
    bookingType: bookingType ?? this.bookingType,
    date: date ?? this.date,
    timeSlot: timeSlot ?? this.timeSlot,
    numberOfPersons: numberOfPersons ?? this.numberOfPersons,
    tables: tables ?? this.tables,
    tableCharge: tableCharge ?? this.tableCharge,
    totalAmount: totalAmount ?? this.totalAmount,
    paymentMode: paymentMode ?? this.paymentMode,
    createdAt: createdAt ?? this.createdAt,
    user: user ?? this.user,
    category: category ?? this.category,
  );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    orderSeats: List<OrderSeat>.from(
      json["order_seats"].map((x) => OrderSeat.fromJson(x)),
    ),
    bookingType: json["booking_type"],
    date: DateTime.parse(json["date"]),
    timeSlot: json["time_slot"],
    numberOfPersons: json["number_of_persons"],
    tables: List<Table>.from(json["tables"].map((x) => Table.fromJson(x))),
    tableCharge: json["table_charge"],
    totalAmount: json["total_amount"],
    paymentMode: json["payment_mode"],
    createdAt: DateTime.parse(json["created_at"]),
    user: json["user"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "order_seats": List<dynamic>.from(orderSeats.map((x) => x.toJson())),
    "booking_type": bookingType,
    "date":
        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time_slot": timeSlot,
    "number_of_persons": numberOfPersons,
    "tables": List<dynamic>.from(tables.map((x) => x.toJson())),
    "table_charge": tableCharge,
    "total_amount": totalAmount,
    "payment_mode": paymentMode,
    "created_at": createdAt.toIso8601String(),
    "user": user,
    "category": category,
  };
}

class Item {
  final int id;
  final int foodItem;
  final String foodItemName;
  final int quantity;
  final String price;
  final String totalPrice;

  Item({
    required this.id,
    required this.foodItem,
    required this.foodItemName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  Item copyWith({
    int? id,
    int? foodItem,
    String? foodItemName,
    int? quantity,
    String? price,
    String? totalPrice,
  }) => Item(
    id: id ?? this.id,
    foodItem: foodItem ?? this.foodItem,
    foodItemName: foodItemName ?? this.foodItemName,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    totalPrice: totalPrice ?? this.totalPrice,
  );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    foodItem: json["food_item"],
    foodItemName: json["food_item_name"],
    quantity: json["quantity"],
    price: json["price"],
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "food_item": foodItem,
    "food_item_name": foodItemName,
    "quantity": quantity,
    "price": price,
    "total_price": totalPrice,
  };
}

class OrderSeat {
  final int id;
  final Seat seat;

  OrderSeat({required this.id, required this.seat});

  OrderSeat copyWith({int? id, Seat? seat}) =>
      OrderSeat(id: id ?? this.id, seat: seat ?? this.seat);

  factory OrderSeat.fromJson(Map<String, dynamic> json) =>
      OrderSeat(id: json["id"], seat: Seat.fromJson(json["seat"]));

  Map<String, dynamic> toJson() => {"id": id, "seat": seat.toJson()};
}

class Seat {
  final int id;
  final int seatNumber;
  final String seatPrice;
  final bool isOccupied;
  final int table;

  Seat({
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
    id: json["id"],
    seatNumber: json["seat_number"],
    seatPrice: json["seat_price"],
    isOccupied: json["is_occupied"],
    table: json["table"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seat_number": seatNumber,
    "seat_price": seatPrice,
    "is_occupied": isOccupied,
    "table": table,
  };
}

class Table {
  final List<int> seatIds;
  final int tableId;

  Table({required this.seatIds, required this.tableId});

  Table copyWith({List<int>? seatIds, int? tableId}) =>
      Table(seatIds: seatIds ?? this.seatIds, tableId: tableId ?? this.tableId);

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    seatIds: List<int>.from(json["seat_ids"].map((x) => x)),
    tableId: json["table_id"],
  );

  Map<String, dynamic> toJson() => {
    "seat_ids": List<dynamic>.from(seatIds.map((x) => x)),
    "table_id": tableId,
  };
}
