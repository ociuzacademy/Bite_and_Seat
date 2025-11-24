import 'package:bite_and_seat/modules/chatbot_module/models/chat_option.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final List<ChatOption> options;
  final DateTime timestamp;

  const ChatMessage({
    required this.text,
    required this.isUser,
    required this.options,
    required this.timestamp,
  });
}
