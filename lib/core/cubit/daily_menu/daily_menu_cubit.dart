import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/services/app_services.dart';
import 'package:bite_and_seat/modules/menu_module/errors/no_menu_exception.dart';
import 'package:bite_and_seat/core/models/api_models/daily_menu_model.dart';

part 'daily_menu_cubit.freezed.dart';
part 'daily_menu_state.dart';

class DailyMenuCubit extends Cubit<DailyMenuState> {
  DailyMenuCubit() : super(const DailyMenuState.initial());

  Future<void> getDailyMenu({required DateTime selectedDate}) async {
    emit(const DailyMenuState.dailyMenuLoading());
    try {
      final DailyMenuModel dailyMenu = await AppServices.getDailyMenu(
        selectedDate: selectedDate,
      );
      emit(DailyMenuState.dailyMenuSuccess(dailyMenu));
    } on NoMenuException catch (e) {
      emit(DailyMenuState.dailyMenuUnavailable(e.date, e.message));
    } catch (e) {
      emit(DailyMenuState.dailyMenuError(e.toString()));
    }
  }
}
