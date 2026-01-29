part of 'todays_special_cubit.dart';

@freezed
sealed class TodaysSpecialState with _$TodaysSpecialState {
  const factory TodaysSpecialState.initial() = TodaysSpecialInitial;
  const factory TodaysSpecialState.loading() = TodaysSpecialLoading;
  const factory TodaysSpecialState.error(String errorMessage) =
      TodaysSpecialError;
  const factory TodaysSpecialState.loaded(
    List<TodaysSpecialModel> todaysSpecial,
  ) = TodaysSpecialSuccess;
  const factory TodaysSpecialState.empty() = TodaysSpecialEmpty;
}
