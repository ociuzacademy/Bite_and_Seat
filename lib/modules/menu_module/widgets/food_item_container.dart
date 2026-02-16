// ignore_for_file: public_member_api_docs, sort_constructors_first
// food_item_container.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/models/food_item.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';

class FoodItemContainer extends StatelessWidget {
  final FoodItem foodItem;
  final CartItemModel? cartItem;
  final VoidCallback onAddingItem;
  final VoidCallback onRemovingQuantity;
  final VoidCallback onAddingQuantity;
  const FoodItemContainer({
    super.key,
    required this.foodItem,
    this.cartItem,
    required this.onAddingItem,
    required this.onRemovingQuantity,
    required this.onAddingQuantity,
  });

  @override
  Widget build(BuildContext context) {
    final bool canBePrebooked = foodItem.isTodaysSpecial
        ? (foodItem.bookingRestrictions?.canBeBookedByUsersPrebooked ?? true)
        : true;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: AppPalette.firstColor.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food Image
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(foodItem.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Food Name
                Text(
                  foodItem.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),

                // Food Rate
                Text(
                  '\u{20B9}${foodItem.rate} for ${foodItem.itemsPerPlate}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppPalette.firstColor,
                    fontSize: 16,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                const Spacer(),

                // Price and Add Button
                if (canBePrebooked)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppPalette.firstColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: cartItem == null
                        ? TextButton(
                            onPressed: onAddingItem,
                            child: const Text(
                              'ADD',
                              style: TextStyle(
                                color: AppPalette.firstColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: onRemovingQuantity,
                                icon: const Icon(
                                  Icons.remove,
                                  color: AppPalette.firstColor,
                                ),
                              ),
                              Text(
                                cartItem?.count.toString() ?? '0',
                                style: const TextStyle(
                                  color: AppPalette.firstColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: onAddingQuantity,
                                icon: const Icon(
                                  Icons.add,
                                  color: AppPalette.firstColor,
                                ),
                              ),
                            ],
                          ),
                  )
                else
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      foodItem.bookingRestrictions?.message ??
                          'Cannot be prebooked',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                  ),
              ],
            ),
          ),
          if (foodItem.isTodaysSpecial)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: const BoxDecoration(
                  color: AppPalette.secondColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: const Text(
                  "Today's Special",
                  style: TextStyle(
                    color: AppPalette.firstColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
