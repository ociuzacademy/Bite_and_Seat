import 'package:flutter/material.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';

class MenuStateProvider with ChangeNotifier {
  List<CartItemModel> _cartItems = [];
  FoodTime _foodTime = FoodTime.breakfast;
  DateTime _selectedDate = DateTime.now();
  String _dateSelectionType = 'Today';

  // Getters
  List<CartItemModel> get cartItems => _cartItems;
  FoodTime get foodTime => _foodTime;
  DateTime get selectedDate => _selectedDate;
  String get dateSelectionType => _dateSelectionType;

  // Setters
  void setCartItems(List<CartItemModel> items) {
    _cartItems = items;
    notifyListeners();
  }

  void setFoodTime(FoodTime foodTime) {
    _foodTime = foodTime;
    notifyListeners();
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setDateSelectionType(String type) {
    _dateSelectionType = type;
    notifyListeners();
  }

  // Update the food time based on tab index
  void setFoodTimeFromTabIndex(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _foodTime = FoodTime.breakfast;
        break;
      case 1:
        _foodTime = FoodTime.lunch;
        break;
      case 2:
        _foodTime = FoodTime.eveningSnacks;
        break;
    }
    notifyListeners();
  }

  // Cart operations
  void clearCart() {
    _cartItems = [];
    notifyListeners();
  }

  void addItemToCart(CartItemModel item) {
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.itemId == item.itemId,
    );

    if (existingItemIndex != -1) {
      // Update existing item
      _cartItems[existingItemIndex] = item;
    } else {
      // Add new item
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeItemFromCart(int itemId) {
    _cartItems.removeWhere((item) => item.itemId == itemId);
    notifyListeners();
  }

  void updateCartItemQuantity(int itemId, int newCount) {
    final existingItemIndex = _cartItems.indexWhere(
      (item) => item.itemId == itemId,
    );

    if (existingItemIndex != -1) {
      final existingItem = _cartItems[existingItemIndex];
      final updatedItem = CartItemModel(
        itemId: existingItem.itemId,
        name: existingItem.name,
        ratePerItem: existingItem.ratePerItem,
        count: newCount,
        rate: existingItem.ratePerItem * newCount,
      );
      _cartItems[existingItemIndex] = updatedItem;
      notifyListeners();
    }
  }
}
