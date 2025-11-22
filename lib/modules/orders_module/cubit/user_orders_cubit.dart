import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/orders_module/services/orders_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/orders_module/model/user_order_model.dart';

part 'user_orders_cubit.freezed.dart';
part 'user_orders_state.dart';

class UserOrdersCubit extends Cubit<UserOrdersState> {
  UserOrdersCubit() : super(const UserOrdersState.initial());

  Future<void> getUserOrders() async {
    emit(const UserOrdersState.userOrdersLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      final List<UserOrderModel> userOrders =
          await OrdersServices.getUserOrders(userId: userId);

      if (userOrders.isNotEmpty) {
        emit(UserOrdersState.userOrdersSuccess(userOrders));
      } else {
        emit(const UserOrdersState.userOrdersEmpty());
      }
    } catch (e) {
      emit(UserOrdersState.userOrdersError(e.toString()));
    }
  }
}
