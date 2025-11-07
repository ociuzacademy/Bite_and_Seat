// table_model.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
enum ChairStatus { available, selected, occupied }

class TableModel {
  final String tableId;
  final int numberOfSeats;
  final double bookingPrice;
  final List<ChairModel> chairs;

  TableModel({
    required this.tableId,
    required this.numberOfSeats,
    required this.bookingPrice,
    required this.chairs,
  });

  // Helper getter to check if table has any available chairs
  bool get hasAvailableChairs =>
      chairs.any((chair) => chair.status == ChairStatus.available);

  TableModel copyWith({
    String? tableId,
    int? numberOfSeats,
    double? bookingPrice,
    List<ChairModel>? chairs,
  }) {
    return TableModel(
      tableId: tableId ?? this.tableId,
      numberOfSeats: numberOfSeats ?? this.numberOfSeats,
      bookingPrice: bookingPrice ?? this.bookingPrice,
      chairs: chairs ?? this.chairs,
    );
  }
}

class ChairModel {
  final String chairId;
  final ChairStatus status;
  final int position; // Position around the table (0-5 for 6 chairs)

  ChairModel({
    required this.chairId,
    required this.status,
    required this.position,
  });

  ChairModel copyWith({String? chairId, ChairStatus? status, int? position}) {
    return ChairModel(
      chairId: chairId ?? this.chairId,
      status: status ?? this.status,
      position: position ?? this.position,
    );
  }
}
