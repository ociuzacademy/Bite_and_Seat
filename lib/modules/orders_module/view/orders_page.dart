// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bite_and_seat/core/theme/app_palette.dart';
import 'package:bite_and_seat/modules/orders_module/cubit/user_orders_cubit.dart';
import 'package:bite_and_seat/modules/orders_module/utils/orders_helper.dart';
import 'package:bite_and_seat/modules/orders_module/widgets/empty_orders_list.dart';
import 'package:bite_and_seat/modules/orders_module/widgets/order_card.dart';
import 'package:bite_and_seat/widgets/custom_error_widget.dart';
import 'package:bite_and_seat/widgets/loaders/list_item_loading_widget.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const OrdersPage());

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late final OrdersHelper _ordersHelper;

  @override
  void initState() {
    super.initState();
    _ordersHelper = OrdersHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ordersHelper.userOrdersListInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
        backgroundColor: AppPalette.firstColor,
        iconTheme: const IconThemeData(color: AppPalette.secondColor),
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppPalette.secondColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<UserOrdersCubit, UserOrdersState>(
        builder: (context, state) {
          switch (state) {
            case UserOrdersInitial _:
              return const SizedBox.shrink();
            case UserOrdersLoading _:
              return const ListItemLoadingWidget(itemCount: 5);
            case UserOrdersError(:final errorMessage):
              return CustomErrorWidget(
                onRetry: _ordersHelper.userOrdersListInit,
                errorMessage: errorMessage,
              );
            case UserOrdersEmpty _:
              return const EmptyOrdersList();
            case UserOrdersSuccess(:final userOrders):
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: userOrders.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final order = userOrders[index];
                  return OrderCard(
                    order: order,
                    formatDate: OrdersHelper.formatDate,
                    formatTimeSlot: OrdersHelper.formatTimeSlot,
                    cancelOrder: _ordersHelper.showCancelDialog,
                  );
                },
              );
          }
        },
      ),
    );
  }
}
