// table_booking_provider.dart
import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

class TableBookingProvider with ChangeNotifier {
  List<TableModel> _allTables = [];
  final List<ChairModel> _selectedChairs = [];
  final DateTime selectedDate;
  final CategoryTimeSlotModel selectedTimeSlot;
  final int numberOfPeople;
  final double totalRate;

  TableBookingProvider({
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPeople,
    required this.totalRate,
  });

  // Getters
  List<TableModel> get allTables => _allTables;
  List<ChairModel> get selectedChairs => _selectedChairs;
  int get selectedChairCount => _selectedChairs.length;

  // Get tables that have available chairs
  List<TableModel> get availableTables =>
      _allTables.where((table) => table.hasAvailableChairs).toList();

  // Setters
  set allTables(List<TableModel> value) {
    _allTables = value;
    notifyListeners();
  }

  // Methods
  void initializeTables(List<TableModel> tables) {
    _allTables = tables;
    notifyListeners();
  }

  void toggleChairSelection(TableModel table, ChairModel chair) {
    // If chair is occupied, cannot select
    if (chair.status == ChairStatus.occupied) return;

    final tableIndex = _allTables.indexWhere((t) => t.tableId == table.tableId);
    if (tableIndex == -1) return;

    final chairIndex = table.chairs.indexWhere(
      (c) => c.chairId == chair.chairId,
    );
    if (chairIndex == -1) return;

    final updatedTables = List<TableModel>.from(_allTables);
    final updatedChairs = List<ChairModel>.from(table.chairs);

    if (chair.status == ChairStatus.selected) {
      // Deselect chair
      updatedChairs[chairIndex] = chair.copyWith(status: ChairStatus.available);
      _selectedChairs.removeWhere((c) => c.chairId == chair.chairId);
    } else {
      // Check if we can select more chairs
      if (_selectedChairs.length >= numberOfPeople) {
        // Cannot select more than needed
        return;
      }
      // Select chair
      updatedChairs[chairIndex] = chair.copyWith(status: ChairStatus.selected);
      _selectedChairs.add(updatedChairs[chairIndex]);
    }

    updatedTables[tableIndex] = table.copyWith(chairs: updatedChairs);
    _allTables = updatedTables;
    notifyListeners();
  }

  void clearSelection() {
    // Reset all selected chairs to available
    final updatedTables = _allTables.map((table) {
      final updatedChairs = table.chairs.map((chair) {
        if (chair.status == ChairStatus.selected) {
          return chair.copyWith(status: ChairStatus.available);
        }
        return chair;
      }).toList();
      return table.copyWith(chairs: updatedChairs);
    }).toList();

    _allTables = updatedTables;
    _selectedChairs.clear();
    notifyListeners();
  }

  bool get canProceedToPayment {
    return _selectedChairs.length == numberOfPeople;
  }

  double get totalBookingPrice {
    if (_selectedChairs.isEmpty) return totalRate;

    // Calculate price based on tables used (group chairs by table)
    final tableIds = _selectedChairs.map((chair) {
      return chair.chairId.split('_table')[1].split('_chair')[0];
    }).toSet();

    double tableCost = 0;
    for (final tableId in tableIds) {
      final table = _allTables.firstWhere(
        (t) => t.tableId.contains(tableId),
        orElse: () => TableModel(
          tableId: '',
          numberOfSeats: 0,
          bookingPrice: 0,
          chairs: [],
        ),
      );
      tableCost += table.bookingPrice;
    }

    return totalRate + tableCost;
  }

  // Get selected tables (tables that have selected chairs)
  List<TableModel> get selectedTables {
    final selectedTableIds = _selectedChairs.map((chair) {
      return chair.chairId.split('_table')[1].split('_chair')[0];
    }).toSet();

    return _allTables.where((table) {
      final tableIdPart = table.tableId.split('_table')[1];
      return selectedTableIds.contains(tableIdPart);
    }).toList();
  }
}
