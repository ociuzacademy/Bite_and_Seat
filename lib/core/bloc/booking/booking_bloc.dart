import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/menu_module/services/menu_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';

part 'booking_bloc.freezed.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<_Step1BookingStarted>(_onStep1);
  }

  Future<void> _onStep1(
    _Step1BookingStarted event,
    Emitter<BookingState> emit,
  ) async {
    emit(const BookingState.bookingLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      final BookingResponseModel response = await MenuServices.bookingStep1(
        userId: userId,
        bookingDetails: event.bookingDetails,
      );

      emit(BookingState.step1Completed(response));
    } catch (e) {
      emit(BookingState.bookingError(e.toString()));
    }
  }
}
