import 'package:bite_and_seat/core/enums/food_time.dart';

class AppUtils {
  static FoodTime getFoodTimeFromCategory(int category) {
    switch (category) {
      case 1:
        return FoodTime.breakfast;
      case 2:
        return FoodTime.lunch;
      default:
        return FoodTime.eveningSnacks;
    }
  }
}
