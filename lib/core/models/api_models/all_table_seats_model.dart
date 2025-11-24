// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final allTableSeatsModel = allTableSeatsModelFromJson(jsonString);

import 'dart:convert';

AllTableSeatsModel allTableSeatsModelFromJson(String str) =>
    AllTableSeatsModel.fromJson(json.decode(str));

String allTableSeatsModelToJson(AllTableSeatsModel data) =>
    json.encode(data.toJson());

class AllTableSeatsModel {
  final String status;
  final int totalTables;
  final Filters filters;
  final List<Datum> data;

  const AllTableSeatsModel({
    required this.status,
    required this.totalTables,
    required this.filters,
    required this.data,
  });

  AllTableSeatsModel copyWith({
    String? status,
    int? totalTables,
    Filters? filters,
    List<Datum>? data,
  }) => AllTableSeatsModel(
    status: status ?? this.status,
    totalTables: totalTables ?? this.totalTables,
    filters: filters ?? this.filters,
    data: data ?? this.data,
  );

  factory AllTableSeatsModel.fromJson(Map<String, dynamic> json) =>
      AllTableSeatsModel(
        status: json['status'],
        totalTables: json['total_tables'],
        filters: Filters.fromJson(json['filters']),
        data: List<Datum>.from(json['data'].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'total_tables': totalTables,
    'filters': filters.toJson(),
    'data': List<dynamic>.from(data.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'AllTableSeatsModel(status: $status, totalTables: $totalTables, filters: $filters, data: $data)';
  }
}

class Datum {
  final int id;
  final String tableName;
  final int numberOfSeats;
  final List<Seat> seats;

  const Datum({
    required this.id,
    required this.tableName,
    required this.numberOfSeats,
    required this.seats,
  });

  Datum copyWith({
    int? id,
    String? tableName,
    int? numberOfSeats,
    List<Seat>? seats,
  }) => Datum(
    id: id ?? this.id,
    tableName: tableName ?? this.tableName,
    numberOfSeats: numberOfSeats ?? this.numberOfSeats,
    seats: seats ?? this.seats,
  );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json['id'],
    tableName: json['table_name'],
    numberOfSeats: json['number_of_seats'],
    seats: List<Seat>.from(json['seats'].map((x) => Seat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'table_name': tableName,
    'number_of_seats': numberOfSeats,
    'seats': List<dynamic>.from(seats.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'Datum(id: $id, tableName: $tableName, numberOfSeats: $numberOfSeats, seats: $seats)';
  }
}

class Seat {
  final int id;
  final int seatNumber;
  final bool isBooked;

  const Seat({
    required this.id,
    required this.seatNumber,
    required this.isBooked,
  });

  Seat copyWith({int? id, int? seatNumber, bool? isBooked}) => Seat(
    id: id ?? this.id,
    seatNumber: seatNumber ?? this.seatNumber,
    isBooked: isBooked ?? this.isBooked,
  );

  factory Seat.fromJson(Map<String, dynamic> json) => Seat(
    id: json['id'],
    seatNumber: json['seat_number'],
    isBooked: json['is_booked'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'seat_number': seatNumber,
    'is_booked': isBooked,
  };

  @override
  String toString() =>
      'Seat(id: $id, seatNumber: $seatNumber, isBooked: $isBooked)';
}

class Filters {
  final DateTime? date;
  final String? category;
  final String? timeSlotId;

  const Filters({this.date, this.category, this.timeSlotId});

  Filters copyWith({DateTime? date, String? category, String? timeSlotId}) =>
      Filters(
        date: date ?? this.date,
        category: category ?? this.category,
        timeSlotId: timeSlotId ?? this.timeSlotId,
      );

  factory Filters.fromJson(Map<String, dynamic> json) => Filters(
    date: DateTime.parse(json['date']),
    category: json['category'],
    timeSlotId: json['time_slot_id'],
  );

  Map<String, dynamic> toJson() => {
    'date':
        "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    'category': category,
    'time_slot_id': timeSlotId,
  };

  @override
  String toString() =>
      'Filters(date: $date, category: $category, timeSlotId: $timeSlotId)';
}
