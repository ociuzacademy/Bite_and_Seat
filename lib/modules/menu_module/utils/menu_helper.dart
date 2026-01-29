// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/constants/app_urls.dart';
import 'package:bite_and_seat/core/enums/booking_type.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/modules/login_module/view/login_page.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';
import 'package:bite_and_seat/core/models/api_models/daily_menu_model.dart'
    hide Item;
import 'package:bite_and_seat/modules/menu_module/providers/menu_state_provider.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class MenuHelper {
  final BuildContext context;
  final MenuStateProvider menuStateProvider;
  final TabController tabController;
  const MenuHelper({
    required this.context,
    required this.menuStateProvider,
    required this.tabController,
  });

  bool isTabEnabled(int tabIndex, DateTime selectedDate) {
    if (!_isToday(selectedDate)) {
      return true; // All tabs enabled for future dates
    }

    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);

    switch (tabIndex) {
      case 0: // Breakfast
        return currentTime.hour < 11;
      case 1: // Lunch
        return currentTime.hour < 15;
      case 2: // Evening Snacks
        return currentTime.hour < 18;
      default:
        return true;
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  void autoSwitchToAvailableTab() {
    if (!_isToday(menuStateProvider.selectedDate)) {
      return; // Only auto-switch for today
    }

    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);
    int targetTab = 0;

    if (currentTime.hour >= 18) {
      // After 6 PM, all tabs are disabled, but we'll show Evening Snacks with disabled message
      targetTab = 2;
    } else if (currentTime.hour >= 15) {
      // After 3 PM, switch to Evening Snacks
      targetTab = 2;
    } else if (currentTime.hour >= 11) {
      // After 11 AM, switch to Lunch
      targetTab = 1;
    } else {
      // Before 11 AM, stay on Breakfast
      targetTab = 0;
    }

    // Only switch if the current tab is not the target tab
    if (tabController.index != targetTab) {
      tabController.animateTo(targetTab);
    }
  }

  void showTabDisabledMessage(int tabIndex) {
    String message = '';
    switch (tabIndex) {
      case 0:
        message = 'Breakfast is only available until 11:00 AM';
        break;
      case 1:
        message = 'Lunch is only available until 3:00 PM';
        break;
      case 2:
        message = 'Evening snacks are only available until 6:00 PM';
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Also update the loadMenuForSelectedDate to auto-switch when date changes
  void loadMenuForSelectedDate() {
    final cubit = context.read<DailyMenuCubit>();
    cubit.getDailyMenu(selectedDate: menuStateProvider.selectedDate);

    // Auto-switch to available tab when date changes
    autoSwitchToAvailableTab();
  }

  void handleTabChange() {
    debugPrint(
      'Tab change detected - indexIsChanging: ${tabController.indexIsChanging}, index: ${tabController.index}',
    );

    // Handle when the tab change animation completes
    if (!tabController.indexIsChanging) {
      debugPrint(
        'Tab change completed - updating state for index: ${tabController.index}',
      );

      // Update food time based on current tab index
      FoodTime newFoodTime;
      switch (tabController.index) {
        case 0:
          newFoodTime = FoodTime.breakfast;
          break;
        case 1:
          newFoodTime = FoodTime.lunch;
          break;
        case 2:
          newFoodTime = FoodTime.eveningSnacks;
          break;
        default:
          newFoodTime = FoodTime.breakfast;
      }

      debugPrint('Setting food time to: $newFoodTime');
      menuStateProvider.setFoodTime(newFoodTime);

      debugPrint('Clearing cart');
      menuStateProvider.clearCart();
    }
  }

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
    final MenuBookingBloc menuBookingBloc = context.read<MenuBookingBloc>();
    menuBookingBloc.add(MenuBookingEvent.bookingMenu(bookingDetails));
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
      bookingType: BookingType.prebooked,
      categoryId: _getCategoryId(menuStateProvider.foodTime),
      bookingDate: menuStateProvider.selectedDate,
      items: menuStateProvider.cartItems.map((item) {
        return Item(foodItemId: item.itemId, quantity: item.count);
      }).toList(),
    );
    final MenuBookingBloc menuBookingBloc = context.read<MenuBookingBloc>();
    menuBookingBloc.add(MenuBookingEvent.bookingMenu(bookingDetails));
  }

  void selectToday() {
    menuStateProvider.setDateSelectionType('Today');
    menuStateProvider.setSelectedDate(DateTime.now());
    loadMenuForSelectedDate();
    autoSwitchToAvailableTab(); // Add this
  }

  Future<void> selectCustomDate() async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    DateTime initialDateForPicker = menuStateProvider.selectedDate;
    if (menuStateProvider.selectedDate.year == today.year &&
        menuStateProvider.selectedDate.month == today.month &&
        menuStateProvider.selectedDate.day == today.day) {
      initialDateForPicker = tomorrow;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDateForPicker,
      firstDate: tomorrow,
      lastDate: today.add(const Duration(days: 7)),
      selectableDayPredicate: (DateTime day) {
        return day.weekday != DateTime.sunday;
      },
    );

    if (picked != null) {
      menuStateProvider.setSelectedDate(picked);
      menuStateProvider.setDateSelectionType('Custom Date');

      if (picked.weekday == DateTime.sunday) {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context,
          message: 'Canteen is closed on Sunday. Please select another date.',
        );
        menuStateProvider.setSelectedDate(DateTime.now());
        menuStateProvider.setDateSelectionType('Today');
      }
    } else {
      menuStateProvider.setDateSelectionType('Today');
      menuStateProvider.setSelectedDate(DateTime.now());
    }

    loadMenuForSelectedDate();
    autoSwitchToAvailableTab(); // Add this
  }

  void userLogout() {
    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(const AuthEvent.userLoggingOut());
  }

  void navigateToLogin() {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(context, LoginPage.route(), (route) => false);
  }

  static List<FoodItem> getFoodItemsForTime(
    DailyMenuModel dailyMenu,
    FoodTime foodTime,
  ) {
    return dailyMenu.items
        .where((item) => item.category == foodTime)
        .map(
          (item) => FoodItem(
            foodItemId: item.id,
            name: item.name,
            rate: double.parse(item.rate),
            itemsPerPlate: int.parse(item.itemPerPlate),
            imageUrl: '${AppUrls.baseUrl}/${item.image}',
          ),
        )
        .toList();
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
