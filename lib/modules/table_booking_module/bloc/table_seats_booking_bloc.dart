import 'package:bite_and_seat/modules/table_booking_module/services/table_booking_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/models/api_models/booking_response_model.dart';
import 'package:bite_and_seat/modules/table_booking_module/models/selected_tables_model.dart';

part 'table_seats_booking_bloc.freezed.dart';
part 'table_seats_booking_event.dart';
part 'table_seats_booking_state.dart';

class TableSeatsBookingBloc
    extends Bloc<TableSeatsBookingEvent, TableSeatsBookingState> {
  TableSeatsBookingBloc() : super(const TableSeatsBookingInitial()) {
    on<_BookingTableSeats>(_onBookingTableSeats);
  }

  Future<void> _onBookingTableSeats(
    _BookingTableSeats event,
    Emitter<TableSeatsBookingState> emit,
  ) async {
    emit(const TableSeatsBookingState.tableSeatsBookingLoading());
    try {
      final BookingResponseModel response =
          await TableBookingServices.bookingStep3(
            orderId: event.orderId,
            selectedTables: event.selectedTables,
          );

      emit(TableSeatsBookingState.tableSeatsBookingSuccess(response));
    } catch (e) {
      emit(TableSeatsBookingState.tableSeatsBookingError(e.toString()));
    }
  }
}
