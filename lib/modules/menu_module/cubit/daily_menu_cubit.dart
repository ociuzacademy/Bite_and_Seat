import 'package:bite_and_seat/modules/menu_module/errors/no_menu_exception.dart';
import 'package:bite_and_seat/modules/menu_module/models/daily_menu_model.dart';
import 'package:bite_and_seat/modules/menu_module/services/menu_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_menu_state.dart';
part 'daily_menu_cubit.freezed.dart';

class DailyMenuCubit extends Cubit<DailyMenuState> {
  DailyMenuCubit() : super(DailyMenuState.initial());

  Future<void> getDailyMenu({DateTime? selectedDate}) async {
    emit(const DailyMenuState.dailyMenuLoading());
    try {
      final DailyMenuModel dailyMenu = await MenuServices.getDailyMenu(
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
