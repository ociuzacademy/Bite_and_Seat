// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/modules/booking_module/view/booking_page.dart';

class MenuHelper {
  final BuildContext context;
  final ValueNotifier<List<CartItemModel>> cartItems;
  final ValueNotifier<FoodTime> foodTime;
  const MenuHelper({
    required this.context,
    required this.cartItems,
    required this.foodTime,
  });

  // Function to add a new item to the cart
  void addItemToCart(FoodItem foodItem) {
    final currentItems = cartItems.value;
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.itemId == foodItem.foodItemId,
    );

    if (existingItemIndex != -1) {
      // Item already exists, increase quantity
      final existingItem = currentItems[existingItemIndex];
      final updatedItem = CartItemModel(
        itemId: existingItem.itemId,
        name: existingItem.name,
        ratePerItem: existingItem.ratePerItem,
        count: existingItem.count + 1,
        rate: existingItem.ratePerItem * (existingItem.count + 1),
      );

      currentItems[existingItemIndex] = updatedItem;
    } else {
      // Item doesn't exist, add new item
      final newItem = CartItemModel(
        itemId: foodItem.foodItemId,
        name: foodItem.name,
        ratePerItem: foodItem.rate,
        count: 1,
        rate: foodItem.rate,
      );

      currentItems.add(newItem);
    }

    cartItems.value = List.from(currentItems);
  }

  // Function to increase quantity of an item
  void increaseQuantity(FoodItem foodItem) {
    final currentItems = cartItems.value;
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.itemId == foodItem.foodItemId,
    );

    if (existingItemIndex != -1) {
      final existingItem = currentItems[existingItemIndex];
      final updatedItem = CartItemModel(
        itemId: existingItem.itemId,
        name: existingItem.name,
        ratePerItem: existingItem.ratePerItem,
        count: existingItem.count + 1,
        rate: existingItem.ratePerItem * (existingItem.count + 1),
      );

      currentItems[existingItemIndex] = updatedItem;
      cartItems.value = List.from(currentItems);
    }
  }

  // Function to decrease quantity of an item
  void decreaseQuantity(FoodItem foodItem) {
    final currentItems = cartItems.value;
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.itemId == foodItem.foodItemId,
    );

    if (existingItemIndex != -1) {
      final existingItem = currentItems[existingItemIndex];

      if (existingItem.count > 1) {
        // Decrease quantity
        final updatedItem = CartItemModel(
          itemId: existingItem.itemId,
          name: existingItem.name,
          ratePerItem: existingItem.ratePerItem,
          count: existingItem.count - 1,
          rate: existingItem.ratePerItem * (existingItem.count - 1),
        );

        currentItems[existingItemIndex] = updatedItem;
      } else {
        // Remove item if quantity becomes 0
        currentItems.removeAt(existingItemIndex);
      }

      cartItems.value = List.from(currentItems);
    }
  }

  void skipAddToCartProcess() {
    cartItems.value = [];
    Navigator.push(
      context,
      BookingPage.route(cartItems: [], foodTime: foodTime.value),
    );
  }

  void navigateToBooking() {
    Navigator.push(
      context,
      BookingPage.route(cartItems: cartItems.value, foodTime: foodTime.value),
    );
  }
}
