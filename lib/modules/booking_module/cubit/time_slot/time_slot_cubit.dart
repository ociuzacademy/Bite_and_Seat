import 'package:bite_and_seat/core/enums/food_time.dart';
import 'package:bite_and_seat/modules/booking_module/models/category_time_slot_model.dart';
import 'package:bite_and_seat/modules/booking_module/services/booking_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'time_slot_state.dart';
part 'time_slot_cubit.freezed.dart';

class TimeSlotCubit extends Cubit<TimeSlotState> {
  TimeSlotCubit() : super(const TimeSlotState.initial());

  Future<void> getCategoryTimeSlots(FoodTime foodTime) async {
    emit(const TimeSlotState.timeSlotLoading());
    try {
      final List<CategoryTimeSlotModel> timeSlots =
          await BookingServices.getCategoryTimeSlots(foodTime: foodTime);
      emit(TimeSlotState.categoryTimeSlotsSuccess(timeSlots));
    } catch (e) {
      emit(TimeSlotState.timeSlotError(e.toString()));
    }
  }
}
