import 'package:bite_and_seat/modules/table_booking_module/services/table_booking_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/booking_module/classes/step2_booking_details.dart';
import 'package:bite_and_seat/modules/booking_module/services/booking_services.dart';
import 'package:bite_and_seat/modules/menu_module/classes/step1_booking_details.dart';
import 'package:bite_and_seat/modules/menu_module/services/menu_services.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/selected_tables_model.dart';

part 'booking_bloc.freezed.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(const BookingInitial()) {
    on<_Step1BookingStarted>(_onStep1);
    on<_Step2BookingStarted>(_onStep2);
    on<_Step3BookingStarted>(_onStep3);
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

  Future<void> _onStep2(
    _Step2BookingStarted event,
    Emitter<BookingState> emit,
  ) async {
    emit(const BookingState.bookingLoading());
    try {
      final BookingResponseModel response = await BookingServices.bookingStep1(
        orderId: event.orderId,
        bookingDetails: event.bookingDetails,
      );

      emit(BookingState.step2Completed(response));
    } catch (e) {
      emit(BookingState.bookingError(e.toString()));
    }
  }

  Future<void> _onStep3(
    _Step3BookingStarted event,
    Emitter<BookingState> emit,
  ) async {
    emit(const BookingState.bookingLoading());
    try {
      final BookingResponseModel response =
          await TableBookingServices.bookingStep3(
            orderId: event.orderId,
            selectedTables: event.selectedTables,
          );

      emit(BookingState.step2Completed(response));
    } catch (e) {
      emit(BookingState.bookingError(e.toString()));
    }
  }
}
