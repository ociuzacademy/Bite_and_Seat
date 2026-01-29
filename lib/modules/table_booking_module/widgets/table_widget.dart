// table_widget.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/modules/table_booking_module/helper/table_u_i_helper.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_with_chairs.dart';
import 'package:flutter/material.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

typedef SelectChairMethod = void Function(TableModel table, ChairModel chair);

class TableWidget extends StatelessWidget {
  final TableModel table;
  final SelectChairMethod onSelectChair;
  final VoidCallback? onSelectTable;

  const TableWidget({
    super.key,
    required this.table,
    required this.onSelectChair,
    this.onSelectTable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Table info
          Column(
            children: [
              Text(
                table.tableName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${table.numberOfSeats} Seats - \u{20B9}${table.bookingPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text(
                '${TableUIHelper.getAvailableChairCount(table)} available',
                style: TextStyle(
                  fontSize: 10,
                  color: TableUIHelper.getAvailableChairCount(table) > 0
                      ? Colors.green
                      : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Table visualization with chairs
          TableWithChairs(
            onSelectTable: onSelectTable,
            onSelectChair: onSelectChair,
            table: table,
          ),

          const SizedBox(height: 8),

          // Available chairs info
          Text(
            '${TableUIHelper.getAvailableChairCount(table)}/${table.numberOfSeats} available',
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
