// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/constants/app_constants.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/orders_module/model/order_model.dart';
import 'package:bite_and_seat/modules/orders_module/utils/orders_helper.dart';
import 'package:bite_and_seat/modules/orders_module/widgets/empty_orders_list.dart';
import 'package:bite_and_seat/modules/orders_module/widgets/order_card.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  static route() => MaterialPageRoute(builder: (context) => const OrdersPage());

  @override
  State<OrdersPage> createState() => _OrdersPageState();

  // Sample orders data - in a real app, this would come from a database or API
  static List<OrderModel> orders = [
    OrderModel(
      orderId: 'RES-2023-0012',
      date: DateTime(2023, 12, 15),
      timeSlot: AppConstants.afternoonSlots[1],
      foodTime: FoodTime.lunch,
      cartItems: [
        const CartItemModel(
          itemId: 1,
          name: 'Meals',
          ratePerItem: 60.0,
          count: 1,
          rate: 60.0,
        ),
        const CartItemModel(
          itemId: 2,
          name: 'Chicken Biryani',
          ratePerItem: 120.0,
          count: 1,
          rate: 120.0,
        ),
      ],
      numberOfPersons: 2,
      rate: 180.0,
      tableId: 'Table 5',
      roomId: 'Room 1',
      status: OrderStatus.completed,
    ),
    OrderModel(
      orderId: 'RES-2023-0011',
      date: DateTime(2023, 12, 14),
      timeSlot: AppConstants.afternoonSlots[3],
      foodTime: FoodTime.lunch,
      cartItems: [
        const CartItemModel(
          itemId: 1,
          name: 'Meals',
          ratePerItem: 60.0,
          count: 1,
          rate: 60.0,
        ),
        const CartItemModel(
          itemId: 3,
          name: 'Half Chicken Biryani',
          ratePerItem: 60.0,
          count: 1,
          rate: 60.0,
        ),
      ],
      numberOfPersons: 2,
      rate: 120.0,
      tableId: 'Table 3',
      roomId: 'Room 2',
      status: OrderStatus.completed,
    ),
    OrderModel(
      orderId: 'RES-2023-0010',
      date: DateTime(2023, 12, 16),
      timeSlot: AppConstants.morningSlots[0],
      foodTime: FoodTime.breakfast,
      cartItems: [
        const CartItemModel(
          itemId: 1,
          name: 'Meals',
          ratePerItem: 60.0,
          count: 2,
          rate: 60.0,
        ),
        const CartItemModel(
          itemId: 7,
          name: 'Chicken Curry',
          ratePerItem: 80.0,
          count: 1,
          rate: 80.0,
        ),
        const CartItemModel(
          itemId: 8,
          name: 'Beef Curry',
          ratePerItem: 80.0,
          count: 1,
          rate: 80.0,
        ),
      ],
      numberOfPersons: 2,
      rate: 280.0,
      tableId: 'Table 8',
      roomId: 'Room 3',
      status: OrderStatus.upcoming,
    ),
  ];
}

class _OrdersPageState extends State<OrdersPage> {
  late final OrdersHelper _ordersHelper;

  @override
  void initState() {
    super.initState();
    _ordersHelper = OrdersHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final orders = OrdersPage.orders;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reservations'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: const IconThemeData(color: AppPalette.secondColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.secondColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: orders.isEmpty
          ? const EmptyOrdersList()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: orders.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final order = orders[index];
                return OrderCard(
                  order: order,
                  formatDate: _ordersHelper.formatDate,
                  formatTimeSlot: _ordersHelper.formatTimeSlot,
                  cancelOrder: _ordersHelper.showCancelDialog,
                );
              },
            ),
    );
  }
}
