import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/utils/app_utils.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/chatbot_module/providers/chatbot_provider.dart';

class ChatbotHelper {
  void selectToday(BuildContext context) {
    final ChatbotProvider chatbotProvider = Provider.of(context, listen: false);
    chatbotProvider.setMenuDate(DateTime.now());
    getMenu(context, chatbotProvider.menuDate);
  }

  Future<void> selectCustomDate(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    final ChatbotProvider chatbotProvider = Provider.of(context, listen: false);

    DateTime initialDateForPicker = chatbotProvider.menuDate;
    if (chatbotProvider.menuDate.year == today.year &&
        chatbotProvider.menuDate.month == today.month &&
        chatbotProvider.menuDate.day == today.day) {
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
      chatbotProvider.setMenuDate(picked);

      if (picked.weekday == DateTime.sunday) {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context,
          message: 'Canteen is closed on Sunday. Please select another date.',
        );
        chatbotProvider.setMenuDate(DateTime.now());
      }
    } else {
      chatbotProvider.setMenuDate(DateTime.now());
    }

    if (context.mounted) {
      getMenu(context, chatbotProvider.menuDate);
    }
  }

  void getMenu(BuildContext context, DateTime selectedDate) {
    final DailyMenuCubit dailyMenuCubit = context.read<DailyMenuCubit>();
    // Trigger the API call - the listener in chatbot_page.dart will handle the response
    dailyMenuCubit.getDailyMenu(selectedDate: selectedDate);
  }

  void selectTodaySeats(BuildContext context) {
    final ChatbotProvider chatbotProvider = Provider.of(context, listen: false);
    chatbotProvider.setSeatAllocationDate(DateTime.now());
  }

  Future<void> selectCustomDateSeats(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    final ChatbotProvider chatbotProvider = Provider.of(context, listen: false);

    DateTime initialDateForPicker = chatbotProvider.seatAllocationDate;
    if (chatbotProvider.seatAllocationDate.year == today.year &&
        chatbotProvider.seatAllocationDate.month == today.month &&
        chatbotProvider.seatAllocationDate.day == today.day) {
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
      chatbotProvider.setSeatAllocationDate(picked);

      if (picked.weekday == DateTime.sunday) {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context,
          message: 'Canteen is closed on Sunday. Please select another date.',
        );
        chatbotProvider.setSeatAllocationDate(DateTime.now());
      }
    } else {
      chatbotProvider.setSeatAllocationDate(DateTime.now());
    }
  }

  void getCategories(BuildContext context) {
    final CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();
    categoriesCubit.getCategories();
  }

  void getCategorySlots(BuildContext context, int categoryId) {
    final TimeSlotCubit timeSlotCubit = context.read<TimeSlotCubit>();
    FoodTime foodTime = AppUtils.getFoodTimeFromCategory(categoryId);
    timeSlotCubit.getCategoryTimeSlots(foodTime);
  }

  void getSeatAllocation(
    BuildContext context,
    DateTime date,
    int categoryId,
    int slotId,
  ) {
    final TableSeatsListCubit tableSeatsListCubit = context
        .read<TableSeatsListCubit>();
    tableSeatsListCubit.getAllTableSeatsList(date, categoryId, slotId);
  }

  void selectTodaySpecial(BuildContext context) {
    final ChatbotProvider chatbotProvider = Provider.of(context, listen: false);
    chatbotProvider.setMenuDate(DateTime.now());
    getTodaysSpecial(context, chatbotProvider.menuDate);
  }

  Future<void> selectCustomDateSpecial(BuildContext context) async {
    final DateTime today = DateTime.now();
    final DateTime tomorrow = today.add(const Duration(days: 1));

    final ChatbotProvider chatbotProvider = Provider.of(context, listen: false);

    DateTime initialDateForPicker = chatbotProvider.menuDate;
    if (chatbotProvider.menuDate.year == today.year &&
        chatbotProvider.menuDate.month == today.month &&
        chatbotProvider.menuDate.day == today.day) {
      initialDateForPicker = tomorrow;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDateForPicker,
      firstDate: today,
      lastDate: today.add(const Duration(days: 7)),
      selectableDayPredicate: (DateTime day) {
        return day.weekday != DateTime.sunday;
      },
    );

    if (picked != null) {
      chatbotProvider.setMenuDate(picked);

      if (picked.weekday == DateTime.sunday) {
        if (!context.mounted) return;
        CustomSnackbar.showError(
          context,
          message: 'Canteen is closed on Sunday. Please select another date.',
        );
        chatbotProvider.setMenuDate(DateTime.now());
      }
    } else {
      chatbotProvider.setMenuDate(DateTime.now());
    }

    if (context.mounted) {
      getTodaysSpecial(context, chatbotProvider.menuDate);
    }
  }

  void getTodaysSpecial(BuildContext context, DateTime selectedDate) {
    final TodaysSpecialCubit todaysSpecialCubit = context
        .read<TodaysSpecialCubit>();
    todaysSpecialCubit.getTodaysSpecial(selectedDate);
  }
}
