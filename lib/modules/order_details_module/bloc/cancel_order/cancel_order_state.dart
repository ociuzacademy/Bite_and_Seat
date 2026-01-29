part of 'cancel_order_bloc.dart';

@freezed
sealed class CancelOrderState with _$CancelOrderState {
  const factory CancelOrderState.initial() = CancelOrderInitial;
  const factory CancelOrderState.loading() = CancelOrderLoading;
  const factory CancelOrderState.success(CancelOrderResponseModel response) =
      CancelOrderSuccess;
  const factory CancelOrderState.error(String message) = CancelOrderError;
}
