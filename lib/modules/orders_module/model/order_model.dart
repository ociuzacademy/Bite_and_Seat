// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/time_slot_model.dart';

enum OrderStatus { completed, upcoming }

class OrderModel {
  final String orderId;
  final DateTime date;
  final TimeSlotModel timeSlot;
  final FoodTime foodTime;
  final List<CartItemModel> cartItems;
  final int numberOfPersons;
  final double rate;
  final String tableId;
  final String roomId;
  final OrderStatus status;
  const OrderModel({
    required this.orderId,
    required this.date,
    required this.timeSlot,
    required this.foodTime,
    required this.cartItems,
    required this.numberOfPersons,
    required this.rate,
    required this.tableId,
    required this.roomId,
    required this.status,
  });
}
