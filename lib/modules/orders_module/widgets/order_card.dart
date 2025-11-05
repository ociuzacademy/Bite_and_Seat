// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/order_details_module/view/order_details_page.dart';
import 'package:bite_and_seat/modules/orders_module/model/order_model.dart';
import 'package:bite_and_seat/core/typedefs/format_date_to_string.dart';
import 'package:bite_and_seat/core/typedefs/format_time_slot_to_string.dart';
import 'package:bite_and_seat/modules/orders_module/typedef/order_cancel.dart';
import 'package:bite_and_seat/modules/orders_module/widgets/order_details_row.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.order,
    required this.formatDate,
    required this.formatTimeSlot,
    required this.cancelOrder,
  });

  final OrderModel order;
  final FormatDateToString formatDate;
  final FormatTimeSlotToString formatTimeSlot;
  final OrderCancel cancelOrder;

  @override
  Widget build(BuildContext context) {
    final date = order.date;
    final timeSlot = order.timeSlot;
    final status = order.status;
    final isUpcoming = status == OrderStatus.upcoming;

    return GestureDetector(
      onTap: () =>
          Navigator.push(context, OrderDetailsPage.route(order: order)),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order ID and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order.orderId,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppPalette.blackColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isUpcoming
                          ? AppPalette.firstColor.withValues(alpha: 0.2)
                          : AppPalette.secondColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      status == OrderStatus.completed
                          ? 'Completed'
                          : 'Upcoming',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isUpcoming
                            ? AppPalette.blackColor
                            : AppPalette.firstColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Date and Time
              OrderDetailsRow(
                icon: Icons.calendar_today,
                text: '${formatDate(date)} • ${formatTimeSlot(timeSlot)}',
              ),
              const SizedBox(height: 8),

              // Table Number and Room Number
              Row(
                children: [
                  Expanded(
                    child: OrderDetailsRow(
                      icon: Icons.table_restaurant,
                      text: order.tableId,
                    ),
                  ),
                  Expanded(
                    child: OrderDetailsRow(
                      icon: Icons.meeting_room,
                      text: order.roomId,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Rate
              OrderDetailsRow(
                icon: const IconData(0xf05db, fontFamily: 'MaterialIcons'),
                text: '\u{20B9}${order.rate.toStringAsFixed(2)}',
              ),

              // Action buttons for upcoming reservations
              if (isUpcoming) ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          cancelOrder(order.orderId);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppPalette.errorColor,
                          side: const BorderSide(color: AppPalette.errorColor),
                        ),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Modify reservation
                        },
                        child: const Text('Modify'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
