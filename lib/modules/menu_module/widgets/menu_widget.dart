// ignore_for_file: public_member_api_docs, sort_constructors_first
// menu_widget.dart
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/modules/menu_module/typedefs/cart_item_function.dart';
import 'package:bite_and_seat/modules/menu_module/widgets/food_item_container.dart';

class MenuWidget extends StatelessWidget {
  final FoodTime foodTime;
  final List<FoodItem> foodItems;
  final List<CartItemModel> cartItems;
  final CartItemFunction onAddingItem;
  final CartItemFunction onRemovingQuantity;
  final CartItemFunction onAddingQuantity;
  final VoidCallback onSkippingAddToCart;
  const MenuWidget({
    super.key,
    required this.foodTime,
    required this.foodItems,
    required this.cartItems,
    required this.onAddingItem,
    required this.onRemovingQuantity,
    required this.onAddingQuantity,
    required this.onSkippingAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          if (cartItems.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Book tables directly?"),
                  ElevatedButton(
                    onPressed: onSkippingAddToCart,
                    child: const Text('BOOK'),
                  ),
                ],
              ),
            ),
          GridView.builder(
            shrinkWrap: true, // Add this
            physics: const NeverScrollableScrollPhysics(), // Add this
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8, // Adjust this value as needed
            ),
            itemBuilder: (context, index) {
              final cartItem = cartItems
                  .where(
                    (element) => element.itemId == foodItems[index].foodItemId,
                  )
                  .toList();
              return FoodItemContainer(
                foodItem: foodItems[index],
                cartItem: cartItem.isNotEmpty ? cartItem.first : null,
                onAddingItem: () => onAddingItem(foodItems[index]),
                onRemovingQuantity: () => onRemovingQuantity(foodItems[index]),
                onAddingQuantity: () => onAddingQuantity(foodItems[index]),
              );
            },
            itemCount: foodItems.length,
          ),
        ],
      ),
    );
  }
}
