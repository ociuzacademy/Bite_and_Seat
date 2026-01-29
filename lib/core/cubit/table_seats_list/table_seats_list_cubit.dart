import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/models/api_models/all_table_seats_model.dart';
import 'package:bite_and_seat/core/services/app_services.dart';

part 'table_seats_list_cubit.freezed.dart';
part 'table_seats_list_state.dart';

class TableSeatsListCubit extends Cubit<TableSeatsListState> {
  TableSeatsListCubit() : super(const TableSeatsListState.initial());

  Future<void> getAllTableSeatsList(
    DateTime orderDate,
    int categoryId,
    int slotId,
  ) async {
    emit(const TableSeatsListState.tableSeatsListLoading());
    try {
      final AllTableSeatsModel tableSeatsList =
          await AppServices.getAllTableSeats(
            orderDate: orderDate,
            categoryId: categoryId,
            slotId: slotId,
          );

      emit(TableSeatsListState.tableSeatsListSuccess(tableSeatsList));
    } catch (e) {
      emit(TableSeatsListState.tableSeatsListError(e.toString()));
    }
  }

  void reset() {
    emit(const TableSeatsListState.initial());
  }
}
