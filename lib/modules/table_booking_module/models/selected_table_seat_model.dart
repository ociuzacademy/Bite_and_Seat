// ignore_for_file: public_member_api_docs, sort_constructors_first
class SelectedTableSeatModel {
  final int selectedTableId;
  final List<int> selectedSeats;
  const SelectedTableSeatModel({
    required this.selectedTableId,
    required this.selectedSeats,
  });

  SelectedTableSeatModel copyWith({
    int? selectedTableId,
    List<int>? selectedSeats,
  }) {
    return SelectedTableSeatModel(
      selectedTableId: selectedTableId ?? this.selectedTableId,
      selectedSeats: selectedSeats ?? this.selectedSeats,
    );
  }
}
