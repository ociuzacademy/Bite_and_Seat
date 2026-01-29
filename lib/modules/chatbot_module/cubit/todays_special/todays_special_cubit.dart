import 'package:bite_and_seat/modules/chatbot_module/models/api_models/todays_special_model.dart';
import 'package:bite_and_seat/modules/chatbot_module/services/chatbot_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todays_special_state.dart';
part 'todays_special_cubit.freezed.dart';

class TodaysSpecialCubit extends Cubit<TodaysSpecialState> {
  TodaysSpecialCubit() : super(const TodaysSpecialState.initial());

  Future<void> getTodaysSpecial(DateTime date) async {
    try {
      emit(const TodaysSpecialState.loading());
      final response = await ChatbotServices.getTodaysSpecial(date);
      if (response.isEmpty) {
        emit(const TodaysSpecialState.empty());
      } else {
        emit(TodaysSpecialState.loaded(response));
      }
    } catch (e) {
      emit(TodaysSpecialState.error(e.toString()));
    }
  }

  void reset() {
    emit(const TodaysSpecialState.initial());
  }
}
