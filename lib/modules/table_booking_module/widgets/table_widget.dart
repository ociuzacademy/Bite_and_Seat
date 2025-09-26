// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

typedef SelectTableMethod = void Function(TableModel table);

class TableWidget extends StatelessWidget {
  final TableModel table;
  final Color? statusColor;
  final SelectTableMethod onBookingTable;
  const TableWidget({
    super.key,
    required this.table,
    this.statusColor,
    required this.onBookingTable,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onBookingTable(table);
      },
      child: Container(
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
                  table.tableId.split('_')[1],
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
              ],
            ),

            const SizedBox(height: 8),

            // Table visualization
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: table.status == TableStatus.available
                      ? AppPalette.blackColor
                      : AppPalette.greyColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  table.numberOfSeats.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: table.status == TableStatus.available
                        ? AppPalette.blackColor
                        : AppPalette.whiteColor,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Status text
            Text(
              table.status == TableStatus.available ? 'Available' : 'Occupied',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: table.status == TableStatus.available
                    ? AppPalette.blackColor
                    : AppPalette.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
