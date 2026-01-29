import 'package:bite_and_seat/modules/table_booking_module/helper/table_u_i_helper.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/chair_position_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_widget.dart';
import 'package:flutter/material.dart';

class ChairWidget extends StatelessWidget {
  const ChairWidget({
    super.key,
    required this.position,
    required this.chair,
    required this.onSelectChair,
    required this.table,
  });

  final ChairPositionModel position;
  final ChairModel chair;
  final SelectChairMethod onSelectChair;
  final TableModel table;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.left,
      top: position.top,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque, // Better tap detection
        onTap: () {
          if (chair.status != ChairStatus.occupied) {
            onSelectChair(table, chair);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 36, // Much larger touch target
          height: 36,
          decoration: BoxDecoration(
            color: TableUIHelper.getChairColor(chair.status),
            shape: BoxShape.circle,
            border: Border.all(
              color: TableUIHelper.getChairBorderColor(chair.status),
              width: 2.5,
            ),
            boxShadow: chair.status == ChairStatus.selected
                ? [
                    BoxShadow(
                      color: Colors.blue.withValues(alpha: 0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ]
                : null,
          ),
          child: chair.status == ChairStatus.selected
              ? const Icon(Icons.check, size: 20, color: Colors.white)
              : (chair.status == ChairStatus.occupied
                    ? const Icon(Icons.close, size: 20, color: Colors.white)
                    : null),
        ),
      ),
    );
  }
}
