import 'package:bite_and_seat/modules/booking_module/services/booking_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/booking_module/classes/step2_booking_details.dart';

part 'time_slot_booking_bloc.freezed.dart';
part 'time_slot_booking_event.dart';
part 'time_slot_booking_state.dart';

class TimeSlotBookingBloc
    extends Bloc<TimeSlotBookingEvent, TimeSlotBookingState> {
  TimeSlotBookingBloc() : super(const TimeSlotBookingInitial()) {
    on<_BookingTimeSlot>(_onBookingTimeSlot);
  }

  Future<void> _onBookingTimeSlot(
    _BookingTimeSlot event,
    Emitter<TimeSlotBookingState> emit,
  ) async {
    emit(const TimeSlotBookingState.timeSlotBookingLoading());
    try {
      final BookingResponseModel response = await BookingServices.bookingStep1(
        orderId: event.orderId,
        bookingDetails: event.bookingDetails,
      );

      emit(TimeSlotBookingState.timeSlotBookingSuccess(response));
    } catch (e) {
      emit(TimeSlotBookingState.timeSlotBookingError(e.toString()));
    }
  }
}
