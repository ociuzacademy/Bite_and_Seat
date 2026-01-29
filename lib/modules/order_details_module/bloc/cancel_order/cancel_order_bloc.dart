import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/order_details_module/models/cancel_order_response_model.dart';
import 'package:bite_and_seat/modules/order_details_module/services/order_details_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cancel_order_event.dart';
part 'cancel_order_state.dart';
part 'cancel_order_bloc.freezed.dart';

class CancelOrderBloc extends Bloc<CancelOrderEvent, CancelOrderState> {
  CancelOrderBloc() : super(const CancelOrderInitial()) {
    on<_CancelOrder>(_onCancelOrder);
  }

  Future<void> _onCancelOrder(
    _CancelOrder event,
    Emitter<CancelOrderState> emit,
  ) async {
    emit(const CancelOrderLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      if (userId == 0) {
        emit(const CancelOrderError('User ID not found'));
        return;
      }

      final response = await OrderDetailsServices.cancelOrder(
        orderId: event.orderId,
        userId: userId,
      );
      emit(CancelOrderSuccess(response));
    } catch (e) {
      emit(CancelOrderError(e.toString()));
    }
  }
}
