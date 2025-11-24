import 'package:flutter/material.dart';

import 'package:bite_and_seat/modules/chatbot_module/models/chat_message.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/chat_option.dart';

class ChatbotProvider with ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  List<ChatMessage> get messages => _messages;
  bool get isLoading => _isLoading;

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

  List<ChatOption> _getDateSelectionOptions() {
    return [
      const ChatOption(
        text: 'Today',
        action: 'seat_vacancy_today',
        icon: Icons.today,
      ),
      const ChatOption(
        text: 'Custom Day',
        action: 'seat_vacancy_custom',
        icon: Icons.calendar_today,
      ),
      const ChatOption(
        text: 'Back to Main',
        action: 'back_main',
        icon: Icons.arrow_back,
      ),
    ];
  }

  List<ChatOption> _getTimeSlotOptions() {
    return [
      const ChatOption(
        text: '11:00 AM - 11:30 AM',
        action: 'slot_1',
        icon: Icons.access_time,
      ),
      const ChatOption(
        text: '11:30 AM - 12:00 PM',
        action: 'slot_2',
        icon: Icons.access_time,
      ),
      const ChatOption(
        text: '12:00 PM - 12:30 PM',
        action: 'slot_3',
        icon: Icons.access_time,
      ),
      const ChatOption(
        text: '12:30 PM - 1:00 PM',
        action: 'slot_4',
        icon: Icons.access_time,
      ),
    ];
  }

  Future<void> handleOptionSelection(ChatOption option) async {
    _addUserMessage(option.text);
    _isLoading = true;
    notifyListeners();

    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    _isLoading = false;

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
          _getDateSelectionOptions(),
        );
        break;

      case 'menu_today':
        _addBotMessage(
          'Fetching today\'s menu... This would trigger DailyMenuCubit',
          _getInitialOptions(),
        );
        // Here you would trigger the DailyMenuCubit for today's date
        break;

      case 'menu_custom':
        _addBotMessage('Please select a date to view the menu:', [
          const ChatOption(
            text: 'Select Date',
            action: 'show_date_picker_menu',
            icon: Icons.calendar_today,
          ),
          const ChatOption(
            text: 'Back',
            action: 'back_menu_enquiry',
            icon: Icons.arrow_back,
          ),
        ]);
        break;

      case 'seat_vacancy_today':
        _addBotMessage(
          'Checking seat availability for today. Please select a time slot:',
          _getTimeSlotOptions(),
        );
        break;

      case 'seat_vacancy_custom':
        _addBotMessage('Please select a date to check seat availability:', [
          const ChatOption(
            text: 'Select Date',
            action: 'show_date_picker_seat',
            icon: Icons.calendar_today,
          ),
          const ChatOption(
            text: 'Back',
            action: 'back_seat_enquiry',
            icon: Icons.arrow_back,
          ),
        ]);
        break;

      case 'show_date_picker_menu':
        // This would trigger the date picker in the UI
        _addBotMessage(
          'Date picker would appear here. After selection, DailyMenuCubit would be called.',
          _getInitialOptions(),
        );
        break;

      case 'show_date_picker_seat':
        // This would trigger the date picker in the UI
        _addBotMessage(
          'Date picker would appear here. After selection, seat availability API would be called.',
          _getInitialOptions(),
        );
        break;

      case 'back_main':
      case 'back_menu_enquiry':
      case 'back_seat_enquiry':
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
