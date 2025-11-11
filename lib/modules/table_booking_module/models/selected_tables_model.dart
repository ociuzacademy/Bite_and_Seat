// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/modules/table_booking_module/models/selected_table_seat_model.dart';

class SelectedTablesModel {
  final List<SelectedTableSeatModel> tables;
  const SelectedTablesModel({required this.tables});

  SelectedTablesModel copyWith({List<SelectedTableSeatModel>? tables}) {
    return SelectedTablesModel(tables: tables ?? this.tables);
  }
}
