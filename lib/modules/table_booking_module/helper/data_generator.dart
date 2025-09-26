import 'dart:math';

import 'package:bite_and_seat/modules/table_booking_module/models/table_model.dart';

class DataGenerator {
  List<TableModel> generateRandomTableData() {
    final random = Random();
    final rooms = ['room1', 'room2', 'room3'];
    final seatOptions = [2, 3, 4, 5, 6, 7, 8];

    return rooms
        .map((roomId) {
          return List.generate(10, (tableIndex) {
            final numberOfSeats =
                seatOptions[random.nextInt(seatOptions.length)];
            final status =
                TableStatus.values[random.nextInt(2)]; // Random status

            // Tiered pricing example
            double bookingPrice;
            if (numberOfSeats <= 4) {
              // Lower price for small tables
              bookingPrice = 8.0 * numberOfSeats;
            } else if (numberOfSeats <= 6) {
              // Standard price for medium tables
              bookingPrice = 10.0 * numberOfSeats;
            } else {
              // Premium price for large tables
              bookingPrice = 12.0 * numberOfSeats;
            }

            return TableModel(
              roomId: roomId,
              tableId: '${roomId}_table${tableIndex + 1}',
              numberOfSeats: numberOfSeats,
              bookingPrice: bookingPrice,
              status: status,
            );
          });
        })
        .expand((tables) => tables)
        .toList();
  }
}
