// table_widget.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

typedef SelectChairMethod = void Function(TableModel table, ChairModel chair);

class TableWidget extends StatelessWidget {
  final TableModel table;
  final SelectChairMethod onSelectChair;

  const TableWidget({
    super.key,
    required this.table,
    required this.onSelectChair,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                const SizedBox(height: 4),
                Text(
                  '${_getAvailableChairCount()} available',
                  style: TextStyle(
                    fontSize: 10,
                    color: _getAvailableChairCount() > 0
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Table visualization with chairs
            _buildTableWithChairs(),

            const SizedBox(height: 8),

            // Available chairs info
            Text(
              '${_getAvailableChairCount()}/${table.numberOfSeats} available',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  int _getAvailableChairCount() {
    return table.chairs
        .where((chair) => chair.status == ChairStatus.available)
        .length;
  }

  Widget _buildTableWithChairs() {
    return SizedBox(
      width: 80,
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Table
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: _getTableColor(),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _getTableBorderColor(), width: 2),
            ),
            child: Center(
              child: Text(
                table.numberOfSeats.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: _getTableTextColor(),
                ),
              ),
            ),
          ),

          // Chairs around the table
          ..._buildChairs(),
        ],
      ),
    );
  }

  Color _getTableColor() {
    // Table color based on availability of chairs
    if (_getAvailableChairCount() > 0) {
      return AppPalette.whiteColor;
    } else {
      return Colors.grey.shade300;
    }
  }

  Color _getTableBorderColor() {
    if (_getAvailableChairCount() > 0) {
      return AppPalette.blackColor;
    } else {
      return AppPalette.greyColor;
    }
  }

  Color _getTableTextColor() {
    if (_getAvailableChairCount() > 0) {
      return AppPalette.blackColor;
    } else {
      return AppPalette.whiteColor;
    }
  }

  List<Widget> _buildChairs() {
    final chairs = table.chairs;
    final List<Widget> chairWidgets = [];

    for (final chair in chairs) {
      final position = _getChairPosition(chair.position, table.numberOfSeats);
      chairWidgets.add(
        Positioned(
          left: position.left,
          top: position.top,
          child: GestureDetector(
            onTap: () {
              if (chair.status != ChairStatus.occupied) {
                onSelectChair(table, chair);
              }
            },
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: _getChairColor(chair.status),
                shape: BoxShape.circle,
                border: Border.all(
                  color: _getChairBorderColor(chair.status),
                  width: 1,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return chairWidgets;
  }

  Color _getChairColor(ChairStatus status) {
    switch (status) {
      case ChairStatus.available:
        return Colors.green;
      case ChairStatus.selected:
        return Colors.blue;
      case ChairStatus.occupied:
        return Colors.red;
    }
  }

  Color _getChairBorderColor(ChairStatus status) {
    switch (status) {
      case ChairStatus.available:
        return Colors.green.shade800;
      case ChairStatus.selected:
        return Colors.blue.shade800;
      case ChairStatus.occupied:
        return Colors.red.shade800;
    }
  }

  ({double left, double top}) _getChairPosition(int position, int totalSeats) {
    const tableRadius = 25.0;
    const chairRadius = 6.0;

    switch (totalSeats) {
      case 2:
        return _getPositionFor2Seats(position, tableRadius, chairRadius);
      case 4:
        return _getPositionFor4Seats(position, tableRadius, chairRadius);
      case 6:
        return _getPositionFor6Seats(position, tableRadius, chairRadius);
      default:
        return (left: 0.0, top: 0.0);
    }
  }

  ({double left, double top}) _getPositionFor2Seats(
    int position,
    double tableRadius,
    double chairRadius,
  ) {
    switch (position) {
      case 0: // Top
        return (left: tableRadius - chairRadius, top: -chairRadius * 2);
      case 1: // Bottom
        return (
          left: tableRadius - chairRadius,
          top: tableRadius * 2 - chairRadius,
        );
      default:
        return (left: 0.0, top: 0.0);
    }
  }

  ({double left, double top}) _getPositionFor4Seats(
    int position,
    double tableRadius,
    double chairRadius,
  ) {
    switch (position) {
      case 0: // Top
        return (left: tableRadius - chairRadius, top: -chairRadius * 2);
      case 1: // Right
        return (
          left: tableRadius * 2 - chairRadius,
          top: tableRadius - chairRadius,
        );
      case 2: // Bottom
        return (
          left: tableRadius - chairRadius,
          top: tableRadius * 2 - chairRadius,
        );
      case 3: // Left
        return (left: -chairRadius * 2, top: tableRadius - chairRadius);
      default:
        return (left: 0.0, top: 0.0);
    }
  }

  ({double left, double top}) _getPositionFor6Seats(
    int position,
    double tableRadius,
    double chairRadius,
  ) {
    switch (position) {
      case 0: // Top Left
        return (left: tableRadius / 2 - chairRadius, top: -chairRadius * 2);
      case 1: // Top Right
        return (left: tableRadius * 1.5 - chairRadius, top: -chairRadius * 2);
      case 2: // Right Top
        return (
          left: tableRadius * 2 - chairRadius,
          top: tableRadius / 2 - chairRadius,
        );
      case 3: // Right Bottom
        return (
          left: tableRadius * 2 - chairRadius,
          top: tableRadius * 1.5 - chairRadius,
        );
      case 4: // Bottom Right
        return (
          left: tableRadius * 1.5 - chairRadius,
          top: tableRadius * 2 - chairRadius,
        );
      case 5: // Bottom Left
        return (
          left: tableRadius / 2 - chairRadius,
          top: tableRadius * 2 - chairRadius,
        );
      default:
        return (left: 0.0, top: 0.0);
    }
  }
}
