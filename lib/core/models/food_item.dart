import 'package:bite_and_seat/core/models/api_models/daily_menu_model.dart';

class FoodItem {
  final int foodItemId;
  final String name;
  final String imageUrl;
  final double rate;
  final String itemsPerPlate;
  final bool isTodaysSpecial;
  final BookingRestrictions? bookingRestrictions;

  const FoodItem({
    required this.foodItemId,
    required this.name,
    required this.imageUrl,
    required this.rate,
    required this.itemsPerPlate,
    this.isTodaysSpecial = false,
    this.bookingRestrictions,
  });
}
