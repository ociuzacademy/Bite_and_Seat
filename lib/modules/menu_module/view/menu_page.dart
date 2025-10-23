import 'package:bite_and_seat/modules/menu_module/widgets/daily_menu_tab_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bite_and_seat/core/bloc/auth/auth_bloc.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/complaints_module/view/complaints_page.dart';
import 'package:bite_and_seat/modules/menu_module/cubit/daily_menu_cubit.dart';
import 'package:bite_and_seat/modules/menu_module/utils/menu_helper.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/cart_bottom_bar.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/date_selection_widget.dart';
import 'package:bite_and_seat/modules/orders_module/view/orders_page.dart';
import 'package:bite_and_seat/modules/profile_module/view/profile_page.dart';
import 'package:bite_and_seat/widgets/loaders/overlay_loader.dart';
import 'package:bite_and_seat/widgets/snackbars/custom_snackbar.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();

  static route() => MaterialPageRoute(builder: (context) => MenuPage());
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late final MenuHelper _helper;
  late final TabController _tabController;

  final ValueNotifier<List<CartItemModel>> _cartItems = ValueNotifier([]);
  final ValueNotifier<FoodTime> _foodTime = ValueNotifier(FoodTime.breakfast);
  final ValueNotifier<DateTime> _selectedDate = ValueNotifier(DateTime.now());
  final ValueNotifier<String> _dateSelectionType = ValueNotifier('Today');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _helper = MenuHelper(
      cartItems: _cartItems,
      context: context,
      foodTime: _foodTime,
      selectedDate: _selectedDate,
      dateSelectionType: _dateSelectionType,
    );

    // Load initial menu data
    _helper.loadMenuForSelectedDate();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _cartItems.dispose();
    _foodTime.dispose();
    _selectedDate.dispose();
    _dateSelectionType.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        titleTextStyle: Theme.of(
          context,
        ).textTheme.titleLarge?.copyWith(color: AppPalette.whiteColor),
        backgroundColor: AppPalette.firstColor,
        iconTheme: IconThemeData(color: AppPalette.whiteColor),
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) {
            switch (value) {
              case 0:
                _foodTime.value = FoodTime.breakfast;
                break;
              case 1:
                _foodTime.value = FoodTime.lunch;
                break;
              case 2:
                _foodTime.value = FoodTime.eveningSnacks;
                break;
            }
            _cartItems.value = [];
          },
          indicatorColor: AppPalette.secondColor,
          labelColor: AppPalette.secondColor,
          unselectedLabelColor: AppPalette.greyColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.breakfast_dining, size: 24),
              text: 'Breakfast',
            ),
            Tab(icon: Icon(Icons.lunch_dining, size: 24), text: 'Lunch'),
            Tab(icon: Icon(Icons.coffee, size: 24), text: 'Snacks'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppPalette.firstColor),
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
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _helper.userLogout,
            ),
          ],
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthLoading _:
              OverlayLoader.show(context, message: 'User logging out...');
              break;
            case LogoutSuccess():
              OverlayLoader.hide();
              _helper.navigateToLogin();
              break;
            case AuthError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackbar.showError(
                context,
                message: 'Error: $errorMessage',
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: Column(
          children: [
            // Date Selection Widget
            DateSelectionWidget(
              selectedDate: _selectedDate,
              dateSelectionType: _dateSelectionType,
              onDateSelected: () async {
                await _helper.selectCustomDate();
                // Reload menu after date selection
                _helper.loadMenuForSelectedDate();
              },
            ),

            // Tab Content with Bloc Builder
            Expanded(
              child: BlocBuilder<DailyMenuCubit, DailyMenuState>(
                builder: (context, menuState) {
                  return ValueListenableBuilder(
                    valueListenable: _cartItems,
                    builder: (context, cartItems, child) => TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        DailyMenuTabContent(
                          menuState: menuState,
                          foodTime: FoodTime.breakfast,
                          cartItems: cartItems,
                          loadMenuForSelectedDate:
                              _helper.loadMenuForSelectedDate,
                          onAddingItem: _helper.addItemToCart,
                          onRemovingQuantity: _helper.decreaseQuantity,
                          onAddingQuantity: _helper.increaseQuantity,
                          onSkippingAddToCart: _helper.skipAddToCartProcess,
                        ),
                        DailyMenuTabContent(
                          menuState: menuState,
                          foodTime: FoodTime.lunch,
                          cartItems: cartItems,
                          loadMenuForSelectedDate:
                              _helper.loadMenuForSelectedDate,
                          onAddingItem: _helper.addItemToCart,
                          onRemovingQuantity: _helper.decreaseQuantity,
                          onAddingQuantity: _helper.increaseQuantity,
                          onSkippingAddToCart: _helper.skipAddToCartProcess,
                        ),
                        DailyMenuTabContent(
                          menuState: menuState,
                          foodTime: FoodTime.eveningSnacks,
                          cartItems: cartItems,
                          loadMenuForSelectedDate:
                              _helper.loadMenuForSelectedDate,
                          onAddingItem: _helper.addItemToCart,
                          onRemovingQuantity: _helper.decreaseQuantity,
                          onAddingQuantity: _helper.increaseQuantity,
                          onSkippingAddToCart: _helper.skipAddToCartProcess,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Cart Bottom Bar
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _cartItems,
        builder: (context, cartItems, child) => CartBottomBar(
          cartItems: cartItems,
          onProceedToBooking: _helper.navigateToBooking,
        ),
      ),
    );
  }
}
