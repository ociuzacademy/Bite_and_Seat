// table_widget.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/modules/table_booking_module/helper/table_u_i_helper.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/chair_widget.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class TableWithChairs extends StatelessWidget {
  const TableWithChairs({
    super.key,
    required this.onSelectTable,
    required this.onSelectChair,
    required this.table,
  });

  final VoidCallback? onSelectTable;
  final SelectChairMethod onSelectChair;
  final TableModel table;

  List<Widget> get _buildChairs {
    final chairs = table.chairs;
    final List<Widget> chairWidgets = [];

    for (final chair in chairs) {
      final position = TableUIHelper.getChairPosition(
        chair.position,
        table.numberOfSeats,
      );
      chairWidgets.add(
        ChairWidget(
          position: position,
          chair: chair,
          onSelectChair: onSelectChair,
          table: table,
        ),
      );
    }

    return chairWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 180,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Table
          GestureDetector(
            onTap: onSelectTable,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: TableUIHelper.getTableColor(table),
                shape:
                    BoxShape.circle, // Changed to circle for better aesthetics
                border: Border.all(
                  color: TableUIHelper.getTableBorderColor(table),
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  table.numberOfSeats.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: TableUIHelper.getTableTextColor(table),
                  ),
                ),
              ),
            ),
          ),

          // Chairs around the table
          ..._buildChairs,
        ],
      ),
    );
  }
}
