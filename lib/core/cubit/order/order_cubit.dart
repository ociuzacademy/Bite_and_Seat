import 'package:bite_and_seat/core/models/api_models/order_details_model.dart';
import 'package:bite_and_seat/core/services/app_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState.initial());

  Future<void> getOrderDetails(int orderId) async {
    emit(const OrderState.orderLoading());
    try {
      final OrderDetailsModel orderDetails = await AppServices.getOrderDetails(
        orderId: orderId,
      );

      emit(OrderState.orderDetailsSuccess(orderDetails));
    } catch (e) {
      emit(OrderState.orderError(e.toString()));
    }
  }
}
