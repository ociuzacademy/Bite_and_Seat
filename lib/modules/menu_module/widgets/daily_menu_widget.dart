// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/modules/menu_module/typedefs/cart_item_function.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/breakfast_items_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/evening_snack_items_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/lunch_items_widget.dart';

class DailyMenuWidget extends StatelessWidget {
  final FoodTime foodTime;
  final List<FoodItem> foodItems;
  final List<CartItemModel> cartItems;
  final CartItemFunction onAddingItem;
  final CartItemFunction onRemovingQuantity;
  final CartItemFunction onAddingQuantity;
  final VoidCallback onSkippingAddToCart;
  const DailyMenuWidget({
    super.key,
    required this.foodTime,
    required this.foodItems,
    required this.cartItems,
    required this.onAddingItem,
    required this.onRemovingQuantity,
    required this.onAddingQuantity,
    required this.onSkippingAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return BreakfastItemsWidget(
          foodTime: foodTime,
          foodItems: foodItems,
          cartItems: cartItems,
          onAddingItem: onAddingItem,
          onRemovingQuantity: onRemovingQuantity,
          onAddingQuantity: onAddingQuantity,
          onSkippingAddToCart: onSkippingAddToCart,
        );
      case FoodTime.lunch:
        return LunchItemsWidget(
          foodTime: foodTime,
          foodItems: foodItems,
          cartItems: cartItems,
          onAddingItem: onAddingItem,
          onRemovingQuantity: onRemovingQuantity,
          onAddingQuantity: onAddingQuantity,
          onSkippingAddToCart: onSkippingAddToCart,
        );
      case FoodTime.eveningSnacks:
        return EveningSnackItemsWidget(
          foodTime: foodTime,
          foodItems: foodItems,
          cartItems: cartItems,
          onAddingItem: onAddingItem,
          onRemovingQuantity: onRemovingQuantity,
          onAddingQuantity: onAddingQuantity,
          onSkippingAddToCart: onSkippingAddToCart,
        );
    }
  }
}
