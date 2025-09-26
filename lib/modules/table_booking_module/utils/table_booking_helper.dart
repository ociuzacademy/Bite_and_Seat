// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/modules/payment_module/view/payment_page.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class TableBookingHelper {
  final BuildContext context;
  final DateTime selectedDate;
  final TimeSlotModel selectedTimeSlot;
  final int numberOfPersons;
  late final ValueNotifier<List<TableModel>> allTables;
  late final ValueNotifier<String> selectedRoom;
  final ValueNotifier<TableModel?> selectedTable;
  final double totalRate;
  TableBookingHelper({
    required this.context,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPersons,
    required this.allTables,
    required this.selectedRoom,
    required this.selectedTable,
    required this.totalRate,
  });

  void showBookingDialog(TableModel table) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Book Table ${table.tableId.split('_')[1]}'),
          content: Text(
            'This table has ${table.numberOfSeats} seats. Confirm booking?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update table status to occupied using ValueNotifier
                final currentTables = allTables.value;
                final idx = currentTables.indexWhere(
                  (t) => t.tableId == table.tableId,
                );
                if (idx != -1) {
                  if (currentTables[idx].numberOfSeats < numberOfPersons) {
                    Navigator.pop(context);
                    // Navigator.pop(context);
                    CustomSnackbar.showError(
                      context,
                      message: 'Not enough seats in the table',
                    );
                    return;
                  }

                  final updated = List<TableModel>.from(currentTables);
                  updated[idx] = updated[idx].copyWith(
                    status: TableStatus.occupied,
                  );
                  selectedTable.value = updated[idx];
                  allTables.value = updated;
                }

                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  PaymentPage.route(
                    selectedDate: selectedDate,
                    selectedTimeSlot: selectedTimeSlot,
                    numberOfPersons: numberOfPersons,
                    selectedRoomId: selectedRoom.value,
                    selectedTableId: selectedTable.value!.tableId,
                    totalRate: totalRate + selectedTable.value!.bookingPrice,
                  ),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}
