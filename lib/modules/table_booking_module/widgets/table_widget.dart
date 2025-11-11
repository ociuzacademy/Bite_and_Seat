// table_widget.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

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
    );
  }

  int _getAvailableChairCount() {
    return table.chairs
        .where((chair) => chair.status == ChairStatus.available)
        .length;
  }

  Widget _buildTableWithChairs() {
    return SizedBox(
      width: 110, // Slightly reduced for better fit
      height: 110, // Slightly reduced for better fit
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Table
          Container(
            width: 50, // Reduced table size
            height: 50, // Reduced table size
            decoration: BoxDecoration(
              color: _getTableColor(),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: _getTableBorderColor(), width: 2),
            ),
            child: Center(
              child: Text(
                table.numberOfSeats.toString(),
                style: TextStyle(
                  fontSize: 12, // Reduced font size
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
              width: 14, // Slightly smaller chairs
              height: 14, // Slightly smaller chairs
              decoration: BoxDecoration(
                color: _getChairColor(chair.status),
                shape: BoxShape.circle,
                border: Border.all(
                  color: _getChairBorderColor(chair.status),
                  width: 1.5,
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
    const containerSize = 110.0;
    const tableSize = 50.0;
    const chairSize = 14.0;
    const distanceFromTable = 10.0;

    // Calculate the radius of the circle for chairs
    const circleRadius = (tableSize / 2) + distanceFromTable;

    // Calculate angle for each chair
    final angleStep = (2 * pi) / totalSeats;
    // Start from top (270 degrees or -90 degrees) and go clockwise
    final angle = (position * angleStep) - (pi / 2);

    // Calculate position
    const centerX = containerSize / 2;
    const centerY = containerSize / 2;

    final x = centerX + circleRadius * cos(angle);
    final y = centerY + circleRadius * sin(angle);

    return (left: x - (chairSize / 2), top: y - (chairSize / 2));
  }
}
