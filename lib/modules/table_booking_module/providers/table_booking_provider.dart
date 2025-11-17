// table_booking_provider.dart
import 'package:flutter/material.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/selected_table_seat_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/selected_tables_model.dart';

class TableBookingProvider with ChangeNotifier {
  List<TableModel> _allTables = [];
  final List<ChairModel> _selectedChairs = [];

  int? _numberOfPeople;
  double? _totalRate;
  int? _slotId;

  // Getters with null safety
  List<TableModel> get allTables => _allTables;
  List<ChairModel> get selectedChairs => _selectedChairs;
  int get selectedChairCount => _selectedChairs.length;
  int? get numberOfPeople => _numberOfPeople;
  double? get totalRate => _totalRate;
  int? get slotId => _slotId;

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

  set slotId(int? slot) {
    _slotId = slot;
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
    // Return only the base rate from the order (no additional seat charges)
    return _totalRate ?? 0;
  }

  // Get selected tables (tables that have selected chairs)
  List<TableModel> get selectedTables {
    if (_selectedChairs.isEmpty) return [];

    final selectedTableIds = _getSelectedTableIds();

    return _allTables.where((table) {
      return selectedTableIds.contains(table.tableId);
    }).toList();
  }

  // Get individual table-seat combinations
  List<SelectedTableSeatModel> getSelectedTablesSeats() {
    final Map<int, List<int>> tableSeatMap = {};

    // Group selected chairs by table
    for (final chair in _selectedChairs) {
      // Find which table this chair belongs to
      final table = _findTableForChair(chair.chairId);
      if (table != null) {
        final tableId = table.tableId;
        if (!tableSeatMap.containsKey(tableId)) {
          tableSeatMap[tableId] = [];
        }
        tableSeatMap[tableId]!.add(chair.chairId);
      }
    }

    // Convert to SelectedTableSeatModel list
    return tableSeatMap.entries.map((entry) {
      return SelectedTableSeatModel(
        selectedTableId: entry.key,
        selectedSeats: entry.value,
      );
    }).toList();
  }

  // Get the complete selected tables model
  SelectedTablesModel get selectedTablesModel {
    return SelectedTablesModel(tables: getSelectedTablesSeats());
  }

  // Get booking data in the required API format using SelectedTablesModel
  Map<String, dynamic> getBookingData() {
    final selectedTablesModel = this.selectedTablesModel;

    return {
      'tables': selectedTablesModel.tables
          .map(
            (tableSeat) => {
              'table_id': tableSeat.selectedTableId,
              'seat_ids': tableSeat.selectedSeats,
            },
          )
          .toList(),
    };
  }

  // Helper method to find which table a chair belongs to
  TableModel? _findTableForChair(int chairId) {
    for (final table in _allTables) {
      final chairExists = table.chairs.any((chair) => chair.chairId == chairId);
      if (chairExists) {
        return table;
      }
    }
    return null;
  }

  // Helper method to get table IDs from selected chairs
  Set<int> _getSelectedTableIds() {
    final tableIds = <int>{};

    for (final chair in _selectedChairs) {
      final table = _findTableForChair(chair.chairId);
      if (table != null) {
        tableIds.add(table.tableId);
      }
    }

    return tableIds;
  }
}
