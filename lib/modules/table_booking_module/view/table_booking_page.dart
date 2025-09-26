// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/time_slot_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/table_booking_module/helper/data_generator.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/utils/table_booking_helper.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/status_indicator.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_widget.dart';

class TableBookingPage extends StatefulWidget {
  final DateTime selectedDate;
  final TimeSlotModel selectedTimeSlot;
  final int numberOfPeople;
  final double totalRate;
  const TableBookingPage({
    super.key,
    required this.selectedDate,
    required this.selectedTimeSlot,
    required this.numberOfPeople,
    required this.totalRate,
  });

  @override
  State<TableBookingPage> createState() => _TableBookingPageState();

  static route({
    required DateTime selectedDate,
    required TimeSlotModel selectedTimeSlot,
    required int numberOfPeople,
    required double totalRate,
  }) => MaterialPageRoute(
    builder: (context) => TableBookingPage(
      selectedDate: selectedDate,
      selectedTimeSlot: selectedTimeSlot,
      numberOfPeople: numberOfPeople,
      totalRate: totalRate,
    ),
  );
}

class _TableBookingPageState extends State<TableBookingPage> {
  late final TableBookingHelper _tableBookingHelper;

  final DataGenerator _dataGenerator = DataGenerator();

  // State converted to ValueNotifiers
  late final ValueNotifier<List<TableModel>> _allTables;
  late final ValueNotifier<String> _selectedRoom;
  late final ValueNotifier<TableModel?> _selectedTable;

  // Static or non-mutating configs remain as finals
  final List<String> _rooms = const ['room1', 'room2', 'room3'];
  final Map<TableStatus, Color> _statusColors = {
    TableStatus.available: AppPalette.whiteColor,
    TableStatus.occupied: AppPalette.greyColor,
  };

  @override
  void initState() {
    super.initState();
    _allTables = ValueNotifier<List<TableModel>>(
      _dataGenerator.generateRandomTableData(),
    );
    _selectedRoom = ValueNotifier<String>('room1');
    _selectedTable = ValueNotifier(null);
    _tableBookingHelper = TableBookingHelper(
      context: context,
      selectedDate: widget.selectedDate,
      selectedTimeSlot: widget.selectedTimeSlot,
      selectedTable: _selectedTable,
      numberOfPersons: widget.numberOfPeople,
      allTables: _allTables,
      selectedRoom: _selectedRoom,
      totalRate: widget.totalRate,
    );
  }

  @override
  void dispose() {
    _allTables.dispose();
    _selectedRoom.dispose();
    _selectedTable.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Booking'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: IconThemeData(color: AppPalette.whiteColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          // Room selection chips
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50,
              child: ValueListenableBuilder<String>(
                valueListenable: _selectedRoom,
                builder: (context, selectedRoom, _) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _rooms.length,
                    itemBuilder: (context, index) {
                      final room = _rooms[index];
                      final isSelected = selectedRoom == room;

                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ChoiceChip(
                          label: Text(room.toUpperCase()),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              _selectedRoom.value = room;
                            }
                          },
                          selectedColor: AppPalette.firstColor,
                          labelStyle: TextStyle(
                            color: isSelected
                                ? AppPalette.whiteColor
                                : AppPalette.blackColor,
                          ),
                          backgroundColor: AppPalette.greyColor,
                          checkmarkColor: AppPalette.whiteColor,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),

          // Status indicators
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatusIndicator(
                  text: 'Available',
                  color: AppPalette.whiteColor,
                ),
                StatusIndicator(text: 'Occupied', color: AppPalette.greyColor),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Room layout with improved grid
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: _selectedRoom,
              builder: (context, selectedRoom, _) {
                return ValueListenableBuilder<List<TableModel>>(
                  valueListenable: _allTables,
                  builder: (context, allTables, __) {
                    final roomTables = allTables
                        .where((t) => t.roomId == selectedRoom)
                        .toList();

                    return GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.9,
                          ),
                      itemCount: roomTables.length,
                      itemBuilder: (context, index) {
                        final table = roomTables[index];
                        return TableWidget(
                          table: table,
                          statusColor: _statusColors[table.status],
                          onBookingTable: (table) {
                            if (table.status == TableStatus.available) {
                              _tableBookingHelper.showBookingDialog(table);
                            }
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
