import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bite_and_seat/modules/chatbot_module/models/chat_message.dart';
import 'package:bite_and_seat/modules/chatbot_module/models/chat_option.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  final Function(ChatOption) onOptionSelected;

  const ChatBubble({
    super.key,
    required this.message,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: message.isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: message.isUser
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            if (!message.isUser)
              CircleAvatar(
                radius: 16.w,
                backgroundColor: AppPalette.firstColor,
                child: Icon(Icons.smart_toy, size: 16.w, color: Colors.white),
              ),
            if (!message.isUser) SizedBox(width: 8.w),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: message.isUser
                      ? AppPalette.firstColor
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                    bottomLeft: message.isUser
                        ? Radius.circular(12.r)
                        : Radius.circular(4.r),
                    bottomRight: message.isUser
                        ? Radius.circular(4.r)
                        : Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.text,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: message.isUser ? Colors.white : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      _formatTime(message.timestamp),
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: message.isUser
                            ? Colors.white70
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (message.isUser) SizedBox(width: 8.w),
            if (message.isUser)
              CircleAvatar(
                radius: 16.w,
                backgroundColor: Colors.grey.shade300,
                child: Icon(
                  Icons.person,
                  size: 16.w,
                  color: Colors.grey.shade600,
                ),
              ),
          ],
        ),

        // Options buttons
        if (message.options.isNotEmpty && !message.isUser)
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: message.options.map((option) {
              return ActionChip(
                avatar: Icon(
                  option.icon,
                  size: 16.w,
                  color: AppPalette.firstColor,
                ),
                label: Text(
                  option.text,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                backgroundColor: AppPalette.firstColor.withValues(alpha: 0.1),
                onPressed: () => onOptionSelected(option),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  String _formatTime(DateTime timestamp) {
    return '${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}';
  }
}
