// data_generator.dart
import 'dart:math';
import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

class DataGenerator {
  List<TableModel> generateRandomTableData() {
    final random = Random();
    final seatOptions = [2, 4, 6]; // Only 2, 4, or 6 seats

    return List.generate(30, (tableIndex) {
      final numberOfSeats = seatOptions[random.nextInt(seatOptions.length)];

      // Generate chairs with random availability
      final chairs = List.generate(numberOfSeats, (chairIndex) {
        // Randomly set some chairs as occupied (30% chance)
        final isOccupied = random.nextDouble() < 0.3;
        return ChairModel(
          chairId: 'table${tableIndex + 1}_chair$chairIndex',
          status: isOccupied ? ChairStatus.occupied : ChairStatus.available,
          position: chairIndex,
        );
      });

      // Tiered pricing
      double bookingPrice;
      if (numberOfSeats == 2) {
        bookingPrice = 8.0 * numberOfSeats;
      } else if (numberOfSeats == 4) {
        bookingPrice = 10.0 * numberOfSeats;
      } else {
        bookingPrice = 12.0 * numberOfSeats;
      }

      return TableModel(
        tableId: 'table${tableIndex + 1}',
        numberOfSeats: numberOfSeats,
        bookingPrice: bookingPrice,
        chairs: chairs,
      );
    });
  }
}
