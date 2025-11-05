// table_booking_page.dart
import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/payment_module/view/payment_page.dart';
import 'package:bite_and_seat/modules/table_booking_module/helper/data_generator.dart';
import 'package:bite_and_seat/modules/table_booking_module/providers/table_booking_provider.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/status_indicator.dart';
import 'package:bite_and_seat/modules/table_booking_module/widgets/table_widget.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class TableBookingPage extends StatefulWidget {
  final DateTime selectedDate;
  final CategoryTimeSlotModel selectedTimeSlot;
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
    required CategoryTimeSlotModel selectedTimeSlot,
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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TableBookingProvider(
        selectedDate: widget.selectedDate,
        selectedTimeSlot: widget.selectedTimeSlot,
        numberOfPeople: widget.numberOfPeople,
        totalRate: widget.totalRate,
      ),
      child: _TableBookingPageContent(dataGenerator: DataGenerator()),
    );
  }
}

class _TableBookingPageContent extends StatefulWidget {
  final DataGenerator dataGenerator;

  const _TableBookingPageContent({required this.dataGenerator});

  @override
  State<_TableBookingPageContent> createState() =>
      _TableBookingPageContentState();
}

class _TableBookingPageContentState extends State<_TableBookingPageContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TableBookingProvider>(
        context,
        listen: false,
      );
      final tables = widget.dataGenerator.generateRandomTableData();
      provider.initializeTables(tables);
    });
  }

  void _proceedToPayment() {
    final provider = Provider.of<TableBookingProvider>(context, listen: false);

    if (!provider.canProceedToPayment) {
      CustomSnackbar.showError(
        context,
        message: 'Please select exactly ${provider.numberOfPeople} chairs',
      );
      return;
    }

    // Get table IDs from selected chairs
    final selectedTableIds = provider.selectedChairs.map((chair) {
      return chair.chairId.split('_table')[1].split('_chair')[0];
    }).toSet();

    Navigator.push(
      context,
      PaymentPage.route(
        selectedDate: provider.selectedDate,
        selectedTimeSlot: provider.selectedTimeSlot,
        numberOfPersons: provider.numberOfPeople,
        selectedRoomId: provider.selectedRoom,
        selectedTableId: selectedTableIds.join(
          ', ',
        ), // Multiple tables possible
        totalRate: provider.totalBookingPrice,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TableBookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Chairs'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: const IconThemeData(color: AppPalette.whiteColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          // Selection info
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected: ${provider.selectedChairCount}/${provider.numberOfPeople} chairs',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (provider.selectedTables.isNotEmpty)
                      Text(
                        'Tables: ${provider.selectedTables.map((t) => t.tableId.split('_')[1]).join(', ')}',
                        style: const TextStyle(fontSize: 12),
                      ),
                  ],
                ),
                if (provider.selectedChairCount > 0)
                  TextButton(
                    onPressed: provider.clearSelection,
                    child: const Text('Clear Selection'),
                  ),
              ],
            ),
          ),

          // Room selection chips
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: const ['room1', 'room2', 'room3'].length,
                itemBuilder: (context, index) {
                  final room = const ['room1', 'room2', 'room3'][index];
                  final isSelected = provider.selectedRoom == room;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(room.toUpperCase()),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          provider.selectedRoom = room;
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
              ),
            ),
          ),

          // Status indicators
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                StatusIndicator(text: 'Available', color: Colors.green),
                StatusIndicator(text: 'Selected', color: Colors.blue),
                StatusIndicator(text: 'Occupied', color: Colors.red),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Room layout with tables that have available chairs
          Expanded(
            child: provider.availableTablesInRoom.isEmpty
                ? const Center(
                    child: Text(
                      'No available chairs in this room',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.9,
                        ),
                    itemCount: provider.availableTablesInRoom.length,
                    itemBuilder: (context, index) {
                      final table = provider.availableTablesInRoom[index];
                      return TableWidget(
                        table: table,
                        onSelectChair: (table, chair) {
                          provider.toggleChairSelection(table, chair);
                        },
                      );
                    },
                  ),
          ),

          // Proceed to payment button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: provider.canProceedToPayment
                    ? _proceedToPayment
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: provider.canProceedToPayment
                      ? AppPalette.firstColor
                      : Colors.grey,
                  foregroundColor: AppPalette.whiteColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  provider.canProceedToPayment
                      ? 'Proceed to Payment - \u{20B9}${provider.totalBookingPrice.toStringAsFixed(2)}'
                      : 'Select ${provider.numberOfPeople} Chairs',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
