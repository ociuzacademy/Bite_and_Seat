// cart_items_list_widget.dart
import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/booking_module/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';

import 'package:bite_and_seat/core/models/cart_item_model.dart';

class CartItemsListWidget extends StatelessWidget {
  final List<CartItemModel> cartItems;
  const CartItemsListWidget({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final double totalAmount = cartItems.fold(
      0,
      (previousValue, element) => previousValue + element.rate,
    );

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          const Center(
            child: Text(
              'Your Cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),

          // Cart Items List
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return CartItemWidget(item: item);
              },
            ),
          ),

          const Divider(),

          // Total Amount
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\u{20B9}$totalAmount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppPalette.firstColor,
                  ),
                ),
              ],
            ),
          ),

          // Close Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPalette.firstColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
