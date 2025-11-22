part of 'user_orders_cubit.dart';

@freezed
sealed class UserOrdersState with _$UserOrdersState {
  const factory UserOrdersState.initial() = UserOrdersInitial;
  const factory UserOrdersState.userOrdersLoading() = UserOrdersLoading;
  const factory UserOrdersState.userOrdersError(String errorMessage) =
      UserOrdersError;
  const factory UserOrdersState.userOrdersEmpty() = UserOrdersEmpty;
  const factory UserOrdersState.userOrdersSuccess(
    List<UserOrderModel> userOrders,
  ) = UserOrdersSuccess;
}
