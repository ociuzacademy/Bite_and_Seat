// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/enums/booking_type.dart';

class Step1BookingDetails {
  final BookingType bookingType;
  final int categoryId;
  final DateTime bookingDate;
  final List<Item> items;
  const Step1BookingDetails({
    required this.bookingType,
    required this.categoryId,
    required this.bookingDate,
    required this.items,
  });
}

class Item {
  final int foodItemId;
  final int quantity;
  const Item({required this.foodItemId, required this.quantity});
}
