// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/modules/booking_module/providers/booking_state_provider.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/booking_page_body.dart';

class BookingPage extends StatelessWidget {
  final int orderId;
  final List<CartItemModel> cartItems;
  final FoodTime foodTime;
  final DateTime selectedDate;
  const BookingPage({
    super.key,
    required this.orderId,
    required this.cartItems,
    required this.foodTime,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookingStateProvider(),
      child: BookingPageBody(
        orderId: orderId,
        cartItems: cartItems,
        foodTime: foodTime,
        selectedDate: selectedDate,
      ),
    );
  }

  static route({
    required int orderId,
    required List<CartItemModel> cartItems,
    required FoodTime foodTime,
    required DateTime selectedDate,
  }) => MaterialPageRoute(
    builder: (context) => BookingPage(
      orderId: orderId,
      cartItems: cartItems,
      foodTime: foodTime,
      selectedDate: selectedDate,
    ),
  );
}
