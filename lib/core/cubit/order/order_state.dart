part of 'order_cubit.dart';

@freezed
sealed class OrderState with _$OrderState {
  const factory OrderState.initial() = OrderInitial;
  const factory OrderState.orderLoading() = OrderLoading;
  const factory OrderState.orderError(String errorMessage) = OrderError;
  const factory OrderState.orderDetailsSuccess(OrderDetailsModel orderDetails) =
      OrderDetailsSuccess;
}
