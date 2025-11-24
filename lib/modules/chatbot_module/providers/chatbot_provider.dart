import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/chatbot_module/models/chat_message.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/chat_option.dart';
import 'package:bite_and_seat/modules/chatbot_module/utils/chatbot_helper.dart';
import 'package:bite_and_seat/core/models/api_models/daily_menu_model.dart';

class ChatbotProvider with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;
  DateTime _menuDate = DateTime.now();

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;
  DateTime get menuDate => _menuDate;

  void setLoadingStatus(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void setMenuDate(DateTime value) {
    _menuDate = value;
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

  List<ChatOption> _getBackOptions() {
    return [
      const ChatOption(
        text: 'Back to Main',
        action: 'back_main',
        icon: Icons.arrow_back,
      ),
    ];
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
      buffer.writeln('   📁 Category: ${item.category}');
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

      case 'back_main':
      case 'back_menu_enquiry':
        _addBotMessage(
          "Hello! I'm your food assistant. How can I help you today?",
          _getInitialOptions(),
        );
        break;

      default:
        _addBotMessage(
          "I understand you're interested in ${option.text}. Let me help you with that!",
          _getInitialOptions(),
        );
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

  // Call this method when you have the menu data
  void displayMenuData(DailyMenuModel menu) {
    final formattedMenu = _formatMenuData(menu);
    _addBotMessage(formattedMenu, _getBackOptions());
  }

  // Call this method when there's an error or no menu available
  void displayMenuError(String errorMessage) {
    _addBotMessage(
      '❌ $errorMessage\n\nPlease try another date or check back later.',
      _getBackOptions(),
    );
  }

  void resetChat() {
    _messages.clear();
    _isLoading = false;
    _addBotMessage(
      "Hello! I'm your food assistant. How can I help you today?",
      _getInitialOptions(),
    );
  }
}
