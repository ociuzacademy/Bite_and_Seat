// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/bloc/auth/auth_bloc.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/modules/login_module/view/login_page.dart';
import 'package:bite_and_seat/modules/menu_module/cubit/daily_menu_cubit.dart';
import 'package:bite_and_seat/modules/menu_module/models/daily_menu_model.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/modules/booking_module/view/booking_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuHelper {
  final BuildContext context;
  final ValueNotifier<List<CartItemModel>> cartItems;
  final ValueNotifier<FoodTime> foodTime;
  final ValueNotifier<DateTime> selectedDate;
  final ValueNotifier<String> dateSelectionType;

  const MenuHelper({
    required this.context,
    required this.cartItems,
    required this.foodTime,
    required this.selectedDate,
    required this.dateSelectionType,
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
      BookingPage.route(
        cartItems: [],
        foodTime: foodTime.value,
        selectedDate: selectedDate.value,
      ),
    );
  }

  void navigateToBooking() {
    // Check if selected date is Sunday
    if (selectedDate.value.weekday == DateTime.sunday) {
      CustomSnackbar.showError(
        context,
        message: 'Canteen is closed on Sunday. Please select another date.',
      );
    }

    Navigator.push(
      context,
      BookingPage.route(
        cartItems: cartItems.value,
        foodTime: foodTime.value,
        selectedDate: selectedDate.value,
      ),
    );
  }

  Future<void> selectCustomDate() async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    // Calculate the initial date for the date picker
    // If current selected date is today, use tomorrow as initial date
    // Otherwise, use the current selected date
    DateTime initialDateForPicker = selectedDate.value;
    if (selectedDate.value.year == today.year &&
        selectedDate.value.month == today.month &&
        selectedDate.value.day == today.day) {
      initialDateForPicker = tomorrow;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDateForPicker,
      firstDate: tomorrow, // Tomorrow
      lastDate: today.add(const Duration(days: 7)), // 7 days from today
      selectableDayPredicate: (DateTime day) {
        // Disable Sundays
        return day.weekday != DateTime.sunday;
      },
    );

    if (picked != null) {
      selectedDate.value = picked;

      // Show error if somehow Sunday is selected (shouldn't happen due to predicate)
      if (picked.weekday == DateTime.sunday) {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context,
          message: 'Canteen is closed on Sunday. Please select another date.',
        );
        // Reset to today if Sunday is selected
        selectedDate.value = DateTime.now();
        dateSelectionType.value = 'Today';
      }
    } else {
      // If user cancels date picker, reset to Today
      dateSelectionType.value = 'Today';
      selectedDate.value = DateTime.now();
    }
  }

  void userLogout() {
    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(AuthEvent.userLoggingOut());
  }

  void navigateToLogin() {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, LoginPage.route(), (route) => false);
  }

  void loadMenuForSelectedDate() {
    final cubit = context.read<DailyMenuCubit>();
    cubit.getDailyMenu(selectedDate: selectedDate.value);
  }

  static List<FoodItem> getFoodItemsForTime(
    DailyMenuModel dailyMenu,
    FoodTime foodTime,
  ) {
    // Convert DailyMenuModel items to FoodItem and filter by category
    final category = _getCategoryForFoodTime(foodTime);

    return dailyMenu.items
        .where((item) => item.category.toLowerCase() == category)
        .map(
          (item) => FoodItem(
            foodItemId: item.id.toString(),
            name: item.name,
            rate: double.parse(item.rate),
            itemsPerPlate: int.parse(item.itemPerPlate),
            imageUrl: "${AppUrls.baseUrl}/${item.image}",
          ),
        )
        .toList();
  }

  static String _getCategoryForFoodTime(FoodTime foodTime) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return 'breakfast';
      case FoodTime.lunch:
        return 'lunch';
      case FoodTime.eveningSnacks:
        return 'evening_snacks';
    }
  }

  static String formatDate(DateTime date) {
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today (${date.day}/${date.month}/${date.year})';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow (${date.day}/${date.month}/${date.year})';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
