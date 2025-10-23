// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/modules/menu_module/cubit/daily_menu_cubit.dart';
import 'package:bite_and_seat/modules/menu_module/typedefs/cart_item_function.dart';
import 'package:bite_and_seat/modules/menu_module/utils/menu_helper.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/daily_menu_error_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/daily_menu_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/menu_unavailable_widget.dart';

class DailyMenuTabContent extends StatelessWidget {
  final DailyMenuState menuState;
  final FoodTime foodTime;
  final List<CartItemModel> cartItems;
  final VoidCallback loadMenuForSelectedDate;
  final CartItemFunction onAddingItem;
  final CartItemFunction onRemovingQuantity;
  final CartItemFunction onAddingQuantity;
  final VoidCallback onSkippingAddToCart;
  const DailyMenuTabContent({
    super.key,
    required this.menuState,
    required this.foodTime,
    required this.cartItems,
    required this.loadMenuForSelectedDate,
    required this.onAddingItem,
    required this.onRemovingQuantity,
    required this.onAddingQuantity,
    required this.onSkippingAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    switch (menuState) {
      case DailyMenuInitial():
      case DailyMenuLoading():
        return const Center(child: CircularProgressIndicator());
      case DailyMenuError(:final errorMessage):
        return DailyMenuErrorWidget(
          errorMessage: errorMessage,
          loadMenuForSelectedDate: loadMenuForSelectedDate,
        );
      case DailyMenuUnavailable(:final date, :final message):
        return MenuUnavailableWidget(
          message: message,
          formatedDate: MenuHelper.formatDate(date),
        );
      case DailyMenuSuccess(:final dailyMenu):
        final foodItems = MenuHelper.getFoodItemsForTime(dailyMenu, foodTime);
        return DailyMenuWidget(
          foodTime: foodTime,
          foodItems: foodItems,
          cartItems: cartItems,
          onAddingItem: onAddingItem,
          onRemovingQuantity: onRemovingQuantity,
          onAddingQuantity: onAddingQuantity,
          onSkippingAddToCart: onSkippingAddToCart,
        );
      default:
        return SizedBox.shrink();
    }
  }
}
