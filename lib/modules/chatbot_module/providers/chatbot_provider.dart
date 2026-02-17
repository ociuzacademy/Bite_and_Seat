import 'package:bite_and_seat/core/models/api_models/category_time_slot_model.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/chatbot_module/models/chat_message.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/chat_option.dart';
import 'package:bite_and_seat/modules/chatbot_module/utils/chatbot_helper.dart';
import 'package:bite_and_seat/core/models/api_models/daily_menu_model.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/api_models/category_model.dart';
import 'package:bite_and_seat/core/models/api_models/all_table_seats_model.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/api_models/todays_special_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';

class ChatbotProvider with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  DateTime _menuDate = DateTime.now();
  DateTime _seatAllocationDate = DateTime.now();
  int? _selectedCategoryId;
  int? _selectedSlotId;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  DateTime get menuDate => _menuDate;
  DateTime get seatAllocationDate => _seatAllocationDate;
  int? get selectedCategoryId => _selectedCategoryId;
  int? get selectedSlotId => _selectedSlotId;

  void setLoadingStatus(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setMenuDate(DateTime value) {
    _menuDate = value;
    notifyListeners();
  }

  void setSeatAllocationDate(DateTime value) {
    _seatAllocationDate = value;
    notifyListeners();
  }

  void setSelectedCategoryId(int value) {
    _selectedCategoryId = value;
    notifyListeners();
  }

  void setSelectedSlotId(int value) {
    _selectedSlotId = value;
    notifyListeners();
  }

  ChatbotProvider() {
    // Add initial bot message
    _addBotMessage(
      "Hello! I'm your food assistant. How can I help you today?",
      _getInitialOptions(),
    );
  }

  void _addBotMessage(String message, List<ChatOption> options) {
    _messages.add(
      ChatMessage(
        text: message,
        isUser: false,
        options: options,
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  void _addUserMessage(String message) {
    _messages.add(
      ChatMessage(
        text: message,
        isUser: true,
        options: const [],
        timestamp: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  List<ChatOption> _getInitialOptions() {
    return [
      const ChatOption(
        text: 'Menu Enquiry',
        action: 'menu_enquiry',
        icon: Icons.menu_book,
      ),
      const ChatOption(
        text: 'Seat Vacancy Enquiry',
        action: 'seat_vacancy_enquiry',
        icon: Icons.event_seat,
      ),
      const ChatOption(
        text: 'Today\'s Special Enquiry',
        action: 'today_special_enquiry',
        icon: Icons.event_seat,
      ),
    ];
  }

  List<ChatOption> _getMenuEnquiryOptions() {
    return [
      const ChatOption(text: 'Today', action: 'menu_today', icon: Icons.today),
      const ChatOption(
        text: 'Custom Day',
        action: 'menu_custom',
        icon: Icons.calendar_today,
      ),
      const ChatOption(
        text: 'Back to Main',
        action: 'back_main',
        icon: Icons.arrow_back,
      ),
    ];
  }

  List<ChatOption> _getSeatAllocationEnquiryOptions() {
    return [
      const ChatOption(
        text: 'Today',
        action: 'seat_allocation_today',
        icon: Icons.today,
      ),
      const ChatOption(
        text: 'Custom Day',
        action: 'seat_allocation_custom',
        icon: Icons.calendar_today,
      ),
      const ChatOption(
        text: 'Back to Main',
        action: 'back_main',
        icon: Icons.arrow_back,
      ),
    ];
  }

  List<ChatOption> _getTodaySpecialEnquiryOptions() {
    return [
      const ChatOption(
        text: 'Today',
        action: 'today_special_today',
        icon: Icons.today,
      ),
      const ChatOption(
        text: 'Custom Day',
        action: 'today_special_custom',
        icon: Icons.calendar_today,
      ),
      const ChatOption(
        text: 'Back to Main',
        action: 'back_main',
        icon: Icons.arrow_back,
      ),
    ];
  }

  List<ChatOption> _getBackOptions() {
    return [
      const ChatOption(
        text: 'Back to Main',
        action: 'back_main',
        icon: Icons.arrow_back,
      ),
    ];
  }

  // ADD THESE MISSING METHODS:

  List<ChatOption> _getCategoryOptions(List<CategoryModel> categories) {
    return categories.map((category) {
      return ChatOption(
        text: category.name,
        action: 'select_category_${category.id}',
        icon: Icons.category,
      );
    }).toList();
  }

  List<ChatOption> _getTimeSlotOptions(
    List<CategoryTimeSlotModel> timeSlots,
    BuildContext context,
  ) {
    return timeSlots.map((slot) {
      final startTime = _formatTime(slot.startTime, context);
      final endTime = _formatTime(slot.endTime, context);
      return ChatOption(
        text: '$startTime - $endTime',
        action: 'select_slot_${slot.id}',
        icon: Icons.access_time,
      );
    }).toList();
  }

  String _formatTime(String timeString, BuildContext context) {
    try {
      final parts = timeString.split(':');
      final hour = int.parse(parts[0]);
      final minute = int.parse(parts[1]);

      final timeOfDay = TimeOfDay(hour: hour, minute: minute);
      return timeOfDay.format(context);
    } catch (e) {
      return timeString;
    }
  }

  // Format DailyMenuModel into readable text
  String _formatMenuData(DailyMenuModel menu) {
    final buffer = StringBuffer();

    final formattedDate =
        '${menu.date.year}-${menu.date.month.toString().padLeft(2, '0')}-${menu.date.day.toString().padLeft(2, '0')}';

    buffer.writeln('📅 Menu for $formattedDate');
    buffer.writeln();

    for (final item in menu.items) {
      buffer.writeln('🍽️ ${item.name}');
      buffer.writeln('   💰 Price: ₹${item.rate}');
      buffer.writeln('   🍽️ ${item.itemPerPlate} per plate');
      buffer.writeln('   📁 Category: ${item.category.name.label}');
      buffer.writeln();
    }

    return buffer.toString();
  }

  // Format AllTableSeatsModel into readable text
  String _formatSeatAllocationData(AllTableSeatsModel seatData) {
    final buffer = StringBuffer();

    buffer.writeln('🪑 Seat Allocation Details');
    buffer.writeln(
      '📅 Date: ${seatData.filters.date?.toIso8601String().split('T')[0]}',
    );
    buffer.writeln('📊 Total Tables: ${seatData.totalTables}');
    buffer.writeln();

    for (final table in seatData.data) {
      buffer.writeln('🏷️ Table: ${table.tableName}');
      buffer.writeln('   🪑 Total Seats: ${table.numberOfSeats}');

      final availableSeats = table.seats.where((seat) => !seat.isBooked).length;
      final bookedSeats = table.seats.where((seat) => seat.isBooked).length;

      buffer.writeln('   ✅ Available: $availableSeats');
      buffer.writeln('   ❌ Booked: $bookedSeats');

      // Show seat details
      if (table.seats.isNotEmpty) {
        buffer.write('   🪑 Seats: ');
        final seatNumbers = table.seats
            .map((seat) => '${seat.seatNumber}${seat.isBooked ? '❌' : '✅'}')
            .join(', ');
        buffer.writeln(seatNumbers);
      }
      buffer.writeln();
    }

    return buffer.toString();
  }

  Future<void> handleOptionSelection(
    ChatOption option,
    BuildContext context,
  ) async {
    _addUserMessage(option.text);
    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    // Handle different actions
    switch (option.action) {
      case 'menu_enquiry':
        _addBotMessage(
          'Great! Which day would you like to check the menu for?',
          _getMenuEnquiryOptions(),
        );
        break;

      case 'seat_vacancy_enquiry':
        _addBotMessage(
          'I can help you check seat availability. First, let\'s select a date.',
          _getSeatAllocationEnquiryOptions(),
        );
        break;

      case 'today_special_enquiry':
        _addBotMessage(
          'I can help you check today\'s special. First, let\'s select a date.',
          _getTodaySpecialEnquiryOptions(),
        );
        break;

      case 'today_special_today':
        if (!context.mounted) return;
        _handleTodaySpecial(context);
        break;

      case 'today_special_custom':
        if (!context.mounted) return;
        _handleCustomDateSpecial(context);
        break;

      case 'menu_today':
        if (!context.mounted) return;
        _handleTodayMenu(context);
        break;

      case 'menu_custom':
        if (!context.mounted) return;
        _handleCustomDateSelection(context);
        break;

      case 'show_date_picker_menu':
        if (!context.mounted) return;
        _handleCustomDateSelection(context);
        break;

      case 'seat_allocation_today':
        if (!context.mounted) return;
        _handleTodaySeatAllocation(context);
        break;

      case 'seat_allocation_custom':
        if (!context.mounted) return;
        _handleCustomDateSelectionSeatAllocation(context);
        break;

      case 'show_date_picker_seat_allocation':
        if (!context.mounted) return;
        _handleCustomDateSelectionSeatAllocation(context);
        break;

      case 'back_main':
      case 'back_menu_enquiry':
        if (context.mounted) {
          // context.read<DailyMenuCubit>().reset();
          // context.read<TimeSlotCubit>().reset();
          // context.read<TableSeatsListCubit>().reset();
          context.read<CategoriesCubit>().reset();
          context.read<TodaysSpecialCubit>().reset();
        }
        _addBotMessage(
          "Hello! I'm your food assistant. How can I help you today?",
          _getInitialOptions(),
        );
        break;

      default:
        // Handle dynamic category selection
        if (option.action.startsWith('select_category_')) {
          final categoryId = int.parse(option.action.split('_').last);
          _handleCategorySelection(context, categoryId);
        }
        // Handle dynamic time slot selection
        else if (option.action.startsWith('select_slot_')) {
          final slotId = int.parse(option.action.split('_').last);
          _handleTimeSlotSelection(context, slotId);
        } else {
          _addBotMessage(
            "I understand you're interested in ${option.text}. Let me help you with that!",
            _getInitialOptions(),
          );
        }
    }

    _isLoading = false;
    notifyListeners();
  }

  void _handleTodayMenu(BuildContext context) {
    final chatbotHelper = ChatbotHelper();
    chatbotHelper.selectToday(context);
  }

  void _handleCustomDateSelection(BuildContext context) {
    final chatbotHelper = ChatbotHelper();
    chatbotHelper.selectCustomDate(context);
  }

  void _handleTodaySpecial(BuildContext context) {
    final chatbotHelper = ChatbotHelper();
    chatbotHelper.selectTodaySpecial(context);
  }

  void _handleCustomDateSpecial(BuildContext context) {
    final chatbotHelper = ChatbotHelper();
    chatbotHelper.selectCustomDateSpecial(context);
  }

  void _handleTodaySeatAllocation(BuildContext context) {
    final chatbotHelper = ChatbotHelper();
    chatbotHelper.selectTodaySeats(context);
    // After setting date, fetch categories
    _addBotMessage('Fetching available meal categories...', []);
    chatbotHelper.getCategories(context);
  }

  void _handleCustomDateSelectionSeatAllocation(BuildContext context) {
    final chatbotHelper = ChatbotHelper();
    chatbotHelper.selectCustomDateSeats(context);
    // After setting date, fetch categories
    _addBotMessage('Fetching available meal categories...', []);
    chatbotHelper.getCategories(context);
  }

  void _handleCategorySelection(BuildContext context, int categoryId) {
    setSelectedCategoryId(categoryId);
    final chatbotHelper = ChatbotHelper();
    _addBotMessage('Great! Now let me fetch the available time slots...', []);
    chatbotHelper.getCategorySlots(context, categoryId);
  }

  void _handleTimeSlotSelection(BuildContext context, int slotId) {
    setSelectedSlotId(slotId);
    final chatbotHelper = ChatbotHelper();
    _addBotMessage('Checking seat availability for your selection...', []);
    // ADD THIS MISSING METHOD CALL:
    chatbotHelper.getSeatAllocation(
      context,
      seatAllocationDate,
      selectedCategoryId!,
      slotId,
    );
  }

  // ADD THESE MISSING DISPLAY METHODS:

  // Call this method when you have the menu data
  void displayMenuData(DailyMenuModel menu) {
    final formattedMenu = _formatMenuData(menu);
    _addBotMessage(formattedMenu, _getBackOptions());
  }

  // Call this method when you have categories data
  void displayCategories(List<CategoryModel> categories) {
    final options = _getCategoryOptions(categories);
    _addBotMessage('Please select a meal category:', options);
  }

  // Call this method when you have time slots data
  void displayTimeSlots(
    List<CategoryTimeSlotModel> timeSlots,
    BuildContext context,
  ) {
    final options = _getTimeSlotOptions(timeSlots, context);
    _addBotMessage('Please select a time slot:', options);
  }

  // Call this method when you have seat allocation data
  void displaySeatAllocation(AllTableSeatsModel seatData) {
    final formattedSeats = _formatSeatAllocationData(seatData);
    _addBotMessage(formattedSeats, _getBackOptions());
  }

  // Call this method when you have today's special data
  void displayTodaysSpecial(List<TodaysSpecialModel> specials) {
    final formattedSpecials = _formatTodaysSpecialData(specials);
    _addBotMessage(formattedSpecials, _getBackOptions());
  }

  // Call this method when there's an error or no menu available
  void displayMenuError(String errorMessage) {
    _addBotMessage(
      '❌ $errorMessage\n\nPlease try another date or check back later.',
      _getBackOptions(),
    );
  }

  void displayTodaysSpecialError(String errorMessage) {
    _addBotMessage(
      '❌ $errorMessage\n\nPlease try another date or check back later.',
      _getBackOptions(),
    );
  }

  void displayCategoryError(String errorMessage) {
    _addBotMessage(
      '❌ $errorMessage\n\nPlease check back later.',
      _getBackOptions(),
    );
  }

  void displayTimeSlotError(String errorMessage) {
    _addBotMessage(
      '❌ $errorMessage\n\nPlease check back later.',
      _getBackOptions(),
    );
  }

  void displaySeatAllocationError(String errorMessage) {
    _addBotMessage(
      '❌ $errorMessage\n\nPlease try different options or check back later.',
      _getBackOptions(),
    );
  }

  void resetChat() {
    _messages.clear();
    _isLoading = false;
    _selectedCategoryId = null;
    _selectedSlotId = null;
    _addBotMessage(
      "Hello! I'm your food assistant. How can I help you today?",
      _getInitialOptions(),
    );
  }

  String _formatTodaysSpecialData(List<TodaysSpecialModel> specials) {
    final buffer = StringBuffer();

    buffer.writeln('🌟 Today\'s Special Dishes 🌟');
    buffer.writeln();

    for (final special in specials) {
      buffer.writeln('🍽️ ${special.name}');
      buffer.writeln('   📁 Category: ${special.categoryName}');
      buffer.writeln();
    }

    buffer.writeln('NB: These items can only be ordered from the counter.');
    buffer.writeln();

    return buffer.toString();
  }
}
