import 'package:bite_and_seat/modules/chatbot_module/view/chatbot_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/exports/bloc_exports.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/view/booking_page.dart';
import 'package:bite_and_seat/modules/complaints_module/view/complaints_page.dart';
import 'package:bite_and_seat/modules/menu_module/providers/menu_state_provider.dart';
import 'package:bite_and_seat/modules/menu_module/utils/menu_helper.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/cart_bottom_bar.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/daily_menu_tab_content.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/date_selection_widget.dart';
import 'package:bite_and_seat/modules/orders_module/view/orders_page.dart';
import 'package:bite_and_seat/modules/profile_module/view/profile_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class MenuPageContent extends StatefulWidget {
  final TabController tabController;

  const MenuPageContent({super.key, required this.tabController});

  @override
  State<MenuPageContent> createState() => _MenuPageContentState();
}

class _MenuPageContentState extends State<MenuPageContent> {
  late final MenuHelper _helper;

  @override
  void initState() {
    super.initState();

    final menuStateProvider = Provider.of<MenuStateProvider>(
      context,
      listen: false,
    );
    _helper = MenuHelper(
      context: context,
      menuStateProvider: menuStateProvider,
      tabController: widget.tabController,
    );

    // Add listener to handle tab changes from both tap and swipe
    widget.tabController.addListener(_helper.handleTabChange);
    // Load initial menu data after helper is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _helper.loadMenuForSelectedDate();
      _helper.autoSwitchToAvailableTab();
    });
  }

  @override
  void dispose() {
    // Remove the listener to prevent memory leaks
    widget.tabController.removeListener(_helper.handleTabChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show loading if helper is not initialized
    final helper = _helper;

    return Consumer<MenuStateProvider>(
      builder: (context, menuStateProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Booking'),
            titleTextStyle: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
            backgroundColor: AppPalette.firstColor,
            iconTheme: const IconThemeData(color: AppPalette.whiteColor),
            actions: [
              IconButton(
                onPressed: () => _helper.loadMenuForSelectedDate(),
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh Menu',
              ),
            ],
            bottom: TabBar(
              controller: widget.tabController,
              onTap: (index) {
                // Check if tab should be enabled based on time restrictions
                if (_helper.isTabEnabled(
                  index,
                  menuStateProvider.selectedDate,
                )) {
                  widget.tabController.animateTo(index);
                } else {
                  // Show error message if tab is disabled
                  _helper.showTabDisabledMessage(index);
                }
              },
              indicatorColor: AppPalette.secondColor,
              labelColor: AppPalette.secondColor,
              unselectedLabelColor: AppPalette.greyColor,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: _buildTabs(menuStateProvider.selectedDate),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(color: AppPalette.firstColor),
                  child: Text(
                    'Bite & Seat',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppPalette.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.pop(context); // close drawer
                    Navigator.push(context, ProfilePage.route());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_bag),
                  title: const Text('Orders'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, OrdersPage.route());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.report_problem),
                  title: const Text('Complaints'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, ComplaintsPage.route());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.smart_toy),
                  title: const Text('Chatbot'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, ChatbotPage.route());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () => helper.userLogout(),
                ),
              ],
            ),
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  switch (state) {
                    case AuthLoading _:
                      OverlayLoader.show(
                        context,
                        message: 'User logging out...',
                      );
                      break;
                    case LogoutSuccess():
                      OverlayLoader.hide();
                      helper.navigateToLogin();
                      break;
                    case AuthError(:final errorMessage):
                      OverlayLoader.hide();
                      CustomSnackbar.showError(context, message: errorMessage);
                      break;
                    default:
                      OverlayLoader.hide();
                      break;
                  }
                },
              ),
              BlocListener<MenuBookingBloc, MenuBookingState>(
                listener: (context, state) {
                  switch (state) {
                    case MenuBookingLoading():
                      OverlayLoader.show(context, message: 'Step 1...');
                      break;
                    case MenuBookingError(:final errorMessage):
                      OverlayLoader.hide();
                      CustomSnackbar.showError(context, message: errorMessage);
                      break;
                    case MenuBookingSuccess(:final response):
                      OverlayLoader.hide();
                      CustomSnackbar.showSuccess(
                        context,
                        message: response.message,
                      );
                      Navigator.push(
                        context,
                        BookingPage.route(orderId: response.order.id),
                      );
                      break;
                    default:
                      OverlayLoader.hide();

                      break;
                  }
                },
              ),
            ],
            child: Column(
              children: [
                // Date Selection Widget
                DateSelectionWidget(
                  selectedDate: menuStateProvider.selectedDate,
                  dateSelectionType: menuStateProvider.dateSelectionType,
                  onDateSelected: () async {
                    await _helper.selectCustomDate();
                    _helper.loadMenuForSelectedDate();
                  },
                  onTodaySelected: () {
                    _helper.selectToday();
                    _helper.loadMenuForSelectedDate();
                  },
                ),

                // Tab Content with Bloc Builder
                Expanded(
                  child: BlocBuilder<DailyMenuCubit, DailyMenuState>(
                    builder: (context, menuState) {
                      if (menuState is DailyMenuInitial) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          _helper.loadMenuForSelectedDate();
                        });
                      }
                      return TabBarView(
                        controller: widget.tabController,
                        children: <Widget>[
                          DailyMenuTabContent(
                            menuState: menuState,
                            foodTime: FoodTime.breakfast,
                            cartItems: menuStateProvider.cartItems,
                            loadMenuForSelectedDate:
                                _helper.loadMenuForSelectedDate,
                            onAddingItem: _helper.addItemToCart,
                            onRemovingQuantity: _helper.decreaseQuantity,
                            onAddingQuantity: _helper.increaseQuantity,
                            onSkippingAddToCart: _helper.skipAddToCartProcess,
                            isTabEnabled: _isTabEnabled(
                              0,
                              menuStateProvider.selectedDate,
                            ), // Add this
                          ),
                          DailyMenuTabContent(
                            menuState: menuState,
                            foodTime: FoodTime.lunch,
                            cartItems: menuStateProvider.cartItems,
                            loadMenuForSelectedDate:
                                _helper.loadMenuForSelectedDate,
                            onAddingItem: _helper.addItemToCart,
                            onRemovingQuantity: _helper.decreaseQuantity,
                            onAddingQuantity: _helper.increaseQuantity,
                            onSkippingAddToCart: _helper.skipAddToCartProcess,
                            isTabEnabled: _isTabEnabled(
                              1,
                              menuStateProvider.selectedDate,
                            ), // Add this
                          ),
                          DailyMenuTabContent(
                            menuState: menuState,
                            foodTime: FoodTime.eveningSnacks,
                            cartItems: menuStateProvider.cartItems,
                            loadMenuForSelectedDate:
                                _helper.loadMenuForSelectedDate,
                            onAddingItem: _helper.addItemToCart,
                            onRemovingQuantity: _helper.decreaseQuantity,
                            onAddingQuantity: _helper.increaseQuantity,
                            onSkippingAddToCart: _helper.skipAddToCartProcess,
                            isTabEnabled: _isTabEnabled(
                              2,
                              menuStateProvider.selectedDate,
                            ), // Add this
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Cart Bottom Bar
          bottomNavigationBar: CartBottomBar(
            cartItems: menuStateProvider.cartItems,
            onProceedToBooking: helper.submitCartForBooking,
          ),
        );
      },
    );
  }

  List<Widget> _buildTabs(DateTime selectedDate) {
    return <Widget>[
      Tab(
        icon: Icon(
          Icons.breakfast_dining,
          size: 24,
          color: _helper.isTabEnabled(0, selectedDate)
              ? AppPalette.secondColor
              : Colors.grey,
        ),
        text: 'Breakfast',
      ),
      Tab(
        icon: Icon(
          Icons.lunch_dining,
          size: 24,
          color: _helper.isTabEnabled(1, selectedDate)
              ? AppPalette.secondColor
              : Colors.grey,
        ),
        text: 'Lunch',
      ),
      Tab(
        icon: Icon(
          Icons.coffee,
          size: 24,
          color: _helper.isTabEnabled(2, selectedDate)
              ? AppPalette.secondColor
              : Colors.grey,
        ),
        text: 'Snacks',
      ),
    ];
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  bool _isTabEnabled(int tabIndex, DateTime selectedDate) {
    if (!_isToday(selectedDate)) {
      return true; // All tabs enabled for future dates
    }

    final now = DateTime.now();
    final currentTime = TimeOfDay.fromDateTime(now);

    switch (tabIndex) {
      case 0: // Breakfast
        return currentTime.hour < 11 ||
            (currentTime.hour == 11 && currentTime.minute == 0);
      case 1: // Lunch
        return currentTime.hour < 15 ||
            (currentTime.hour == 15 && currentTime.minute == 0);
      case 2: // Evening Snacks
        return currentTime.hour < 18 ||
            (currentTime.hour == 18 && currentTime.minute == 0);
      default:
        return true;
    }
  }
}
