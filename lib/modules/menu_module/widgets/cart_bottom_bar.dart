import 'package:flutter/material.dart';
import 'package:bite_and_seat/core/models/cart_item_model.dart';
import 'package:bite_and_seat/core/theme/app_palette.dart';

class CartBottomBar extends StatelessWidget {
  final List<CartItemModel> cartItems;
  final VoidCallback onProceedToBooking;

  const CartBottomBar({
    super.key,
    required this.cartItems,
    required this.onProceedToBooking,
  });

  @override
  Widget build(BuildContext context) {
    if (cartItems.isEmpty) {
      return const SizedBox.shrink();
    }

    final totalItems = cartItems.fold(0, (sum, item) => sum + item.count);
    final totalAmount = cartItems.fold(0.0, (sum, item) => sum + item.rate);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppPalette.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
        border: Border.all(color: AppPalette.firstColor.withValues(alpha: 0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            // Cart Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '$totalItems ${totalItems == 1 ? 'item' : 'items'} in cart',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppPalette.firstColor,
                    ),
                  ),
                  Text(
                    'Total: \u{20B9}${totalAmount.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppPalette.greyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Proceed Button
            Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppPalette.firstColor, AppPalette.secondColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: AppPalette.firstColor.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: onProceedToBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Proceed to Book',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPalette.whiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppPalette.whiteColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
