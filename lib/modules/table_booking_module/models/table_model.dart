// ignore_for_file: public_member_api_docs, sort_constructors_first
enum TableStatus { available, occupied }

class TableModel {
  final String roomId;
  final String tableId;
  final int numberOfSeats;
  final double bookingPrice;
  final TableStatus status;

  TableModel({
    required this.roomId,
    required this.tableId,
    required this.numberOfSeats,
    required this.bookingPrice,
    required this.status,
  });

  TableModel copyWith({
    String? roomId,
    String? tableId,
    int? numberOfSeats,
    double? bookingPrice,
    TableStatus? status,
  }) {
    return TableModel(
      roomId: roomId ?? this.roomId,
      tableId: tableId ?? this.tableId,
      numberOfSeats: numberOfSeats ?? this.numberOfSeats,
      bookingPrice: bookingPrice ?? this.bookingPrice,
      status: status ?? this.status,
    );
  }
}
