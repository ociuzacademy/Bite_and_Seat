import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/order_details_module/services/order_details_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/order_details_module/class/feedback_data.dart';
import 'package:bite_and_seat/modules/order_details_module/models/submit_feedback_response_model.dart';

part 'submit_feedback_bloc.freezed.dart';
part 'submit_feedback_event.dart';
part 'submit_feedback_state.dart';

class SubmitFeedbackBloc
    extends Bloc<SubmitFeedbackEvent, SubmitFeedbackState> {
  SubmitFeedbackBloc() : super(const SubmitFeedbackInitial()) {
    on<_SubmittingFeedback>(_onSubmittingFeedback);
  }

  Future<void> _onSubmittingFeedback(
    _SubmittingFeedback event,
    Emitter<SubmitFeedbackState> emit,
  ) async {
    emit(const SubmitFeedbackState.submitFeedbackLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      final SubmitFeedbackResponseModel response =
          await OrderDetailsServices.submitFeedback(
            userId: userId,
            feedbackData: event.feedbackData,
          );

      emit(SubmitFeedbackState.submitFeedbackSuccess(response));
    } catch (e) {
      emit(SubmitFeedbackState.submitFeedbackError(e.toString()));
    }
  }
}
