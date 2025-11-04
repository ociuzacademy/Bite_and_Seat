// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/enums/booking_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/bloc/auth/auth_bloc.dart';
import 'package:bite_and_seat/core/bloc/booking/booking_bloc.dart';
import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/modules/login_module/view/login_page.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';
import 'package:bite_and_seat/modules/menu_module/cubit/daily_menu_cubit.dart';
import 'package:bite_and_seat/modules/menu_module/models/daily_menu_model.dart'
    hide Item;
import 'package:bite_and_seat/modules/menu_module/providers/menu_state_provider.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class MenuHelper {
  final BuildContext context;
  final MenuStateProvider menuStateProvider;

  const MenuHelper({required this.context, required this.menuStateProvider});

  // Function to add a new item to the cart
  void addItemToCart(FoodItem foodItem) {
    final currentItems = menuStateProvider.cartItems;
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.itemId == foodItem.foodItemId,
    );

    if (existingItemIndex != -1) {
      // Item already exists, increase quantity
      final existingItem = currentItems[existingItemIndex];
      menuStateProvider.updateCartItemQuantity(
        foodItem.foodItemId,
        existingItem.count + 1,
      );
    } else {
      // Item doesn't exist, add new item
      final newItem = CartItemModel(
        itemId: foodItem.foodItemId,
        name: foodItem.name,
        ratePerItem: foodItem.rate,
        count: 1,
        rate: foodItem.rate,
      );

      menuStateProvider.addItemToCart(newItem);
    }
  }

  // Function to increase quantity of an item
  void increaseQuantity(FoodItem foodItem) {
    final currentItems = menuStateProvider.cartItems;
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.itemId == foodItem.foodItemId,
    );

    if (existingItemIndex != -1) {
      final existingItem = currentItems[existingItemIndex];
      menuStateProvider.updateCartItemQuantity(
        foodItem.foodItemId,
        existingItem.count + 1,
      );
    }
  }

  // Function to decrease quantity of an item
  void decreaseQuantity(FoodItem foodItem) {
    final currentItems = menuStateProvider.cartItems;
    final existingItemIndex = currentItems.indexWhere(
      (item) => item.itemId == foodItem.foodItemId,
    );

    if (existingItemIndex != -1) {
      final existingItem = currentItems[existingItemIndex];

      if (existingItem.count > 1) {
        // Decrease quantity
        menuStateProvider.updateCartItemQuantity(
          foodItem.foodItemId,
          existingItem.count - 1,
        );
      } else {
        // Remove item if quantity becomes 0
        menuStateProvider.removeItemFromCart(foodItem.foodItemId);
      }
    }
  }

  void skipAddToCartProcess() {
    menuStateProvider.clearCart();
    final Step1BookingDetails bookingDetails = Step1BookingDetails(
      bookingType: BookingType.tableOnly,
      categoryId: _getCategoryId(menuStateProvider.foodTime),
      bookingDate: menuStateProvider.selectedDate,
      items: [],
    );
    final BookingBloc bookingBloc = context.read<BookingBloc>();
    bookingBloc.add(BookingEvent.step1BookingStarted(bookingDetails));
  }

  void submitCartForBooking() {
    // Check if selected date is Sunday
    if (menuStateProvider.selectedDate.weekday == DateTime.sunday) {
      CustomSnackbar.showError(
        context,
        message: 'Canteen is closed on Sunday. Please select another date.',
      );
    }

    final Step1BookingDetails bookingDetails = Step1BookingDetails(
      bookingType: BookingType.tableOnly,
      categoryId: _getCategoryId(menuStateProvider.foodTime),
      bookingDate: menuStateProvider.selectedDate,
      items: menuStateProvider.cartItems.map((item) {
        return Item(foodItemId: item.itemId, quantity: item.count);
      }).toList(),
    );
    final BookingBloc bookingBloc = context.read<BookingBloc>();
    bookingBloc.add(BookingEvent.step1BookingStarted(bookingDetails));
  }

  Future<void> selectCustomDate() async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    // Calculate the initial date for the date picker
    // If current selected date is today, use tomorrow as initial date
    // Otherwise, use the current selected date
    DateTime initialDateForPicker = menuStateProvider.selectedDate;
    if (menuStateProvider.selectedDate.year == today.year &&
        menuStateProvider.selectedDate.month == today.month &&
        menuStateProvider.selectedDate.day == today.day) {
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
      menuStateProvider.setSelectedDate(picked);

      // Show error if somehow Sunday is selected (shouldn't happen due to predicate)
      if (picked.weekday == DateTime.sunday) {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context,
          message: 'Canteen is closed on Sunday. Please select another date.',
        );
        // Reset to today if Sunday is selected
        menuStateProvider.setSelectedDate(DateTime.now());
        menuStateProvider.setDateSelectionType('Today');
      }
    } else {
      // If user cancels date picker, reset to Today
      menuStateProvider.setDateSelectionType('Today');
      menuStateProvider.setSelectedDate(DateTime.now());
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
    cubit.getDailyMenu(selectedDate: menuStateProvider.selectedDate);
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
            foodItemId: item.id,
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

  static int _getCategoryId(FoodTime foodTime) {
    switch (foodTime) {
      case FoodTime.breakfast:
        return 1;
      case FoodTime.lunch:
        return 2;
      case FoodTime.eveningSnacks:
        return 3;
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
