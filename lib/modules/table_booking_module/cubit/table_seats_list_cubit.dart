import 'package:bite_and_seat/modules/table_booking_module/services/table_booking_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/table_booking_module/models/all_table_seats_model.dart';

part 'table_seats_list_cubit.freezed.dart';
part 'table_seats_list_state.dart';

class TableSeatsListCubit extends Cubit<TableSeatsListState> {
  TableSeatsListCubit() : super(const TableSeatsListState.initial());

  Future<void> getAllTableSeatsList(DateTime orderDate, int slotId) async {
    emit(const TableSeatsListState.tableSeatsListLoading());
    try {
      final AllTableSeatsModel tableSeatsList =
          await TableBookingServices.getAllTableSeats(
            orderDate: orderDate,
            slotId: slotId,
          );

      emit(TableSeatsListState.tableSeatsListSuccess(tableSeatsList));
    } catch (e) {
      emit(TableSeatsListState.tableSeatsListError(e.toString()));
    }
  }
}
