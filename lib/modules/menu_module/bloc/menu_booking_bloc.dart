import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/menu_module/services/menu_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';

part 'menu_booking_bloc.freezed.dart';
part 'menu_booking_event.dart';
part 'menu_booking_state.dart';

class MenuBookingBloc extends Bloc<MenuBookingEvent, MenuBookingState> {
  MenuBookingBloc() : super(const MenuBookingInitial()) {
    on<_BookingMenu>(_onBookingMenu);
  }

  Future<void> _onBookingMenu(
    _BookingMenu event,
    Emitter<MenuBookingState> emit,
  ) async {
    emit(const MenuBookingLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      final BookingResponseModel response = await MenuServices.bookingStep1(
        userId: userId,
        bookingDetails: event.bookingDetails,
      );

      emit(MenuBookingState.menuBookingSuccess(response));
    } catch (e) {
      emit(MenuBookingState.menuBookingError(e.toString()));
    }
  }
}
