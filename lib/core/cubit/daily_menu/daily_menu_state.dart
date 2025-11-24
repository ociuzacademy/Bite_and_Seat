part of 'daily_menu_cubit.dart';

@freezed
sealed class DailyMenuState with _$DailyMenuState {
  const factory DailyMenuState.initial() = DailyMenuInitial;
  const factory DailyMenuState.dailyMenuLoading() = DailyMenuLoading;
  const factory DailyMenuState.dailyMenuError(String errorMessage) =
      DailyMenuError;
  const factory DailyMenuState.dailyMenuUnavailable(
    DateTime date,
    String message,
  ) = DailyMenuUnavailable;
  const factory DailyMenuState.dailyMenuSuccess(DailyMenuModel dailyMenu) =
      DailyMenuSuccess;
}
