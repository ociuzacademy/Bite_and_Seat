part of 'table_seats_list_cubit.dart';

@freezed
sealed class TableSeatsListState with _$TableSeatsListState {
  const factory TableSeatsListState.initial() = TableSeatsListInitial;
  const factory TableSeatsListState.tableSeatsListLoading() =
      TableSeatsListLoading;
  const factory TableSeatsListState.tableSeatsListError(String errorMessage) =
      TableSeatsListError;
  const factory TableSeatsListState.tableSeatsListSuccess(
    AllTableSeatsModel tableSeatsList,
  ) = TableSeatsListSuccess;
}
