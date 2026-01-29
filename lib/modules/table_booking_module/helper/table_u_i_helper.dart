import 'dart:math';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/chair_position_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:flutter/material.dart';

class TableUIHelper {
  static int getAvailableChairCount(TableModel table) {
    return table.chairs
        .where((chair) => chair.status == ChairStatus.available)
        .length;
  }

  static Color getTableColor(TableModel table) {
    if (TableUIHelper.getAvailableChairCount(table) > 0) {
      return AppPalette.whiteColor;
    } else {
      return Colors.grey.shade300;
    }
  }

  static Color getTableBorderColor(TableModel table) {
    if (TableUIHelper.getAvailableChairCount(table) > 0) {
      return AppPalette.blackColor;
    } else {
      return AppPalette.greyColor;
    }
  }

  static Color getTableTextColor(TableModel table) {
    if (TableUIHelper.getAvailableChairCount(table) > 0) {
      return AppPalette.blackColor;
    } else {
      return AppPalette.whiteColor;
    }
  }

  static Color getChairColor(ChairStatus status) {
    switch (status) {
      case ChairStatus.available:
        return Colors.green.shade400;
      case ChairStatus.selected:
        return Colors.blue.shade500;
      case ChairStatus.occupied:
        return Colors.red.shade400;
    }
  }

  static Color getChairBorderColor(ChairStatus status) {
    switch (status) {
      case ChairStatus.available:
        return Colors.green.shade800;
      case ChairStatus.selected:
        return Colors.blue.shade800;
      case ChairStatus.occupied:
        return Colors.red.shade800;
    }
  }

  static ChairPositionModel getChairPosition(int position, int totalSeats) {
    const containerSize = 180.0;
    const tableSize = 80.0;
    const chairSize = 36.0;
    const distanceFromTable = 20.0;

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

    return ChairPositionModel(
      left: x - (chairSize / 2),
      top: y - (chairSize / 2),
    );
  }
}
