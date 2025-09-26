import 'package:bite_and_seat/modules/complaints_module/view/complaints_page.dart';
import 'package:bite_and_seat/modules/login_module/view/login_page.dart';
import 'package:bite_and_seat/modules/orders_module/view/orders_page.dart';
import 'package:bite_and_seat/modules/profile_module/view/profile_page.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/modules/menu_module/utils/menu_helper.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/breakfast_items_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/dinner_items_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/evening_snack_items_widget.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/lunch_items_widget.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _helper = MenuHelper(
      cartItems: _cartItems,
      context: context,
      foodTime: _foodTime,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _cartItems.dispose();
    _foodTime.dispose();
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
              default:
                _foodTime.value = FoodTime.dinner;
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
            Tab(icon: Icon(Icons.dinner_dining, size: 24), text: 'Dinner'),
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
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  LoginPage.route(),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: _cartItems,
        builder: (context, cartItems, child) => TabBarView(
          controller: _tabController,
          children: <Widget>[
            BreakfastItemsWidget(
              foodTime: FoodTime.breakfast,
              foodItems: AppConstants.breakfastFoodItems,
              cartItems: cartItems,
              onAddingItem: _helper.addItemToCart,
              onRemovingQuantity: _helper.decreaseQuantity,
              onAddingQuantity: _helper.increaseQuantity,
              onSkippingAddToCart: _helper.skipAddToCartProcess,
            ),
            LunchItemsWidget(
              foodTime: FoodTime.lunch,
              foodItems: AppConstants.lunchFoodItems,
              cartItems: cartItems,
              onAddingItem: _helper.addItemToCart,
              onRemovingQuantity: _helper.decreaseQuantity,
              onAddingQuantity: _helper.increaseQuantity,
              onSkippingAddToCart: _helper.skipAddToCartProcess,
            ),
            EveningSnackItemsWidget(
              foodTime: FoodTime.eveningSnacks,
              foodItems: AppConstants.eveningSnackFoodItems,
              cartItems: cartItems,
              onAddingItem: _helper.addItemToCart,
              onRemovingQuantity: _helper.decreaseQuantity,
              onAddingQuantity: _helper.increaseQuantity,
              onSkippingAddToCart: _helper.skipAddToCartProcess,
            ),
            DinnerItemsWidget(
              foodTime: FoodTime.dinner,
              foodItems: AppConstants.dinnerFoodItems,
              cartItems: cartItems,
              onAddingItem: _helper.addItemToCart,
              onRemovingQuantity: _helper.decreaseQuantity,
              onAddingQuantity: _helper.increaseQuantity,
              onSkippingAddToCart: _helper.skipAddToCartProcess,
            ),
          ],
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: _cartItems,
        builder: (context, cartitems, child) => cartitems.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppPalette.firstColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Badge(
                    label: Text("${cartitems.length}"),
                    backgroundColor: AppPalette.secondColor,
                    textColor: AppPalette.firstColor,
                    child: IconButton(
                      onPressed: _helper.navigateToBooking,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPalette.firstColor,
                        iconColor: AppPalette.whiteColor,
                        foregroundColor: AppPalette.whiteColor,
                      ),
                      icon: Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
