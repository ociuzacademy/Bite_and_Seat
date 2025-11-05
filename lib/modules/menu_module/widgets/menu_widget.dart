// menu_widget.dart
import 'package:bite_and_seat/widgets/buttons/primary_button.dart';
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
    final theme = Theme.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          // Book Table Section - Only show when cart is empty
          if (cartItems.isEmpty)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Want to book tables directly?',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Skip adding items and book your table now',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface.withValues(
                              alpha: 0.6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  PrimaryButton(
                    text: 'BOOK NOW',
                    onPressed: onSkippingAddToCart,
                    width: 120,
                  ),
                ],
              ),
            ),
          // Food Items Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
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
