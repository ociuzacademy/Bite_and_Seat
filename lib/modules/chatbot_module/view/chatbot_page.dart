import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/chatbot_module/providers/chatbot_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/modules/chatbot_module/widgets/chat_bubble.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const ChatbotPage());
}

class _ChatbotPageState extends State<ChatbotPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Add a small delay to ensure the widget is built before scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
    );

    return ChangeNotifierProvider(
      create: (context) => ChatbotProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Food Assistant'),
          backgroundColor: AppPalette.firstColor,
          foregroundColor: Colors.white,
          elevation: 0,
          actions: [
            Consumer<ChatbotProvider>(
              builder: (context, chatbotProvider, child) {
                return IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    chatbotProvider.resetChat();
                    // Scroll to bottom after reset
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _scrollToBottom();
                    });
                  },
                );
              },
            ),
          ],
        ),
        body: Consumer<ChatbotProvider>(
          builder: (context, chatbotProvider, child) {
            // Listen to message changes and scroll to bottom
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollToBottom();
            });

            return MultiBlocListener(
              listeners: [
                BlocListener<DailyMenuCubit, DailyMenuState>(
                  listener: (context, state) {
                    switch (state) {
                      case DailyMenuSuccess(:final dailyMenu):
                        chatbotProvider.displayMenuData(dailyMenu);
                        break;
                      case DailyMenuError(:final errorMessage):
                        chatbotProvider.displayMenuError(errorMessage);
                        break;
                      case DailyMenuUnavailable(:final message):
                        chatbotProvider.displayMenuError(message);
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<CategoriesCubit, CategoriesState>(
                  listener: (context, state) {
                    switch (state) {
                      case CategoriesSuccess(:final categories):
                        chatbotProvider.displayCategories(categories);
                        break;
                      case CategoriesError(:final errorMessage):
                        chatbotProvider.displayCategoryError(errorMessage);
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<TimeSlotCubit, TimeSlotState>(
                  listener: (context, state) {
                    switch (state) {
                      case CategoryTimeSlotsSuccess(:final timeSlots):
                        chatbotProvider.displayTimeSlots(timeSlots, context);
                        break;
                      case TimeSlotError(:final errorMessage):
                        chatbotProvider.displayTimeSlotError(errorMessage);
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<TableSeatsListCubit, TableSeatsListState>(
                  listener: (context, state) {
                    switch (state) {
                      case TableSeatsListSuccess(:final tableSeatsList):
                        chatbotProvider.displaySeatAllocation(tableSeatsList);
                        break;
                      case TableSeatsListError(:final errorMessage):
                        chatbotProvider.displaySeatAllocationError(
                          errorMessage,
                        );
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<TodaysSpecialCubit, TodaysSpecialState>(
                  listener: (context, state) {
                    switch (state) {
                      case TodaysSpecialSuccess(:final todaysSpecial):
                        chatbotProvider.displayTodaysSpecial(todaysSpecial);
                        break;
                      case TodaysSpecialEmpty():
                        chatbotProvider.displayTodaysSpecialError(
                          'No special dishes found for this date.',
                        );
                        break;
                      case TodaysSpecialError(:final errorMessage):
                        chatbotProvider.displayTodaysSpecialError(errorMessage);
                        break;
                      default:
                    }
                  },
                ),
              ],
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppPalette.firstColor.withValues(alpha: 0.1),
                            Colors.white,
                          ],
                        ),
                      ),
                      child: chatbotProvider.messages.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              controller:
                                  _scrollController, // Add scroll controller
                              padding: EdgeInsets.all(16.w),
                              reverse: false,
                              itemCount: chatbotProvider.messages.length,
                              itemBuilder: (context, index) {
                                return ChatBubble(
                                  message: chatbotProvider.messages[index],
                                  onOptionSelected: (option) {
                                    chatbotProvider.handleOptionSelection(
                                      option,
                                      context,
                                    );
                                  },
                                );
                              },
                            ),
                    ),
                  ),
                  if (chatbotProvider.isLoading)
                    Container(
                      padding: EdgeInsets.all(16.w),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.w,
                            backgroundColor: AppPalette.firstColor.withValues(
                              alpha: 0.1,
                            ),
                            child: Icon(
                              Icons.smart_toy,
                              size: 20.w,
                              color: AppPalette.firstColor,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                    height: 20.w,
                                    child: const CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        AppPalette.firstColor,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  Text(
                                    'Thinking...',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
