import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/core/models/api_models/category_time_slot_model.dart';
import 'package:bite_and_seat/core/services/app_services.dart';

part 'time_slot_cubit.freezed.dart';
part 'time_slot_state.dart';

class TimeSlotCubit extends Cubit<TimeSlotState> {
  TimeSlotCubit() : super(const TimeSlotState.initial());

  Future<void> getCategoryTimeSlots(FoodTime foodTime) async {
    emit(const TimeSlotState.timeSlotLoading());
    try {
      final List<CategoryTimeSlotModel> timeSlots =
          await AppServices.getCategoryTimeSlots(foodTime: foodTime);
      emit(TimeSlotState.categoryTimeSlotsSuccess(timeSlots));
    } catch (e) {
      emit(TimeSlotState.timeSlotError(e.toString()));
    }
  }

  void reset() {
    emit(const TimeSlotState.initial());
  }
}
