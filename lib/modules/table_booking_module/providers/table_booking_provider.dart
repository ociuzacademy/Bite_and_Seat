// table_booking_provider.dart
import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

class TableBookingProvider with ChangeNotifier {
  List<TableModel> _allTables = [];
  final List<ChairModel> _selectedChairs = [];

  int? _numberOfPeople;
  double? _totalRate;

  // Getters with null safety
  List<TableModel> get allTables => _allTables;
  List<ChairModel> get selectedChairs => _selectedChairs;
  int get selectedChairCount => _selectedChairs.length;
  int? get numberOfPeople => _numberOfPeople;
  double? get totalRate => _totalRate;

  // Get tables that have available chairs OR selected chairs
  List<TableModel> get availableTables => _allTables
      .where(
        (table) =>
            table.hasAvailableChairs ||
            table.chairs.any((chair) => chair.status == ChairStatus.selected),
      )
      .toList();

  // Setters
  set allTables(List<TableModel> value) {
    _allTables = value;
    notifyListeners();
  }

  set numberOfPeople(int? people) {
    _numberOfPeople = people;
    notifyListeners();
  }

  set totalRate(double? rate) {
    _totalRate = rate;
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

    // If numberOfPeople is not set, cannot proceed with selection
    if (_numberOfPeople == null) return;

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
      if (_selectedChairs.length >= _numberOfPeople!) {
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
    return _numberOfPeople != null &&
        _selectedChairs.length == _numberOfPeople!;
  }

  double get totalBookingPrice {
    if (_selectedChairs.isEmpty) return _totalRate ?? 0;

    // Calculate price based on tables used (group chairs by table)
    final tableIds = _getSelectedTableIds();

    double tableCost = 0;
    for (final tableId in tableIds) {
      final table = _allTables.firstWhere(
        (t) => t.tableId == tableId,
        orElse: () => TableModel(
          tableId: '',
          numberOfSeats: 0,
          bookingPrice: 0,
          chairs: [],
        ),
      );
      tableCost += table.bookingPrice;
    }

    return (_totalRate ?? 0) + tableCost;
  }

  // Get selected tables (tables that have selected chairs)
  List<TableModel> get selectedTables {
    if (_selectedChairs.isEmpty) return [];

    final selectedTableIds = _getSelectedTableIds();

    return _allTables.where((table) {
      return selectedTableIds.contains(table.tableId);
    }).toList();
  }

  // Helper method to get table IDs from selected chairs
  Set<String> _getSelectedTableIds() {
    final tableIds = <String>{};

    for (final chair in _selectedChairs) {
      // Extract table ID from chair ID (format: "table1_chair0")
      final parts = chair.chairId.split('_');
      if (parts.length >= 2) {
        // The table ID is the first part (e.g., "table1")
        tableIds.add(parts[0]);
      }
    }

    return tableIds;
  }
}
