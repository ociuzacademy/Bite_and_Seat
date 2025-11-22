import 'package:bite_and_seat/core/localstorage/auth_storage_functions.dart';
import 'package:bite_and_seat/modules/complaints_module/services/complaints_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:bite_and_seat/modules/complaints_module/classes/complaints_data.dart';
import 'package:bite_and_seat/modules/complaints_module/models/submit_report_response_model.dart';

part 'submit_complaint_bloc.freezed.dart';
part 'submit_complaint_event.dart';
part 'submit_complaint_state.dart';

class SubmitComplaintBloc
    extends Bloc<SubmitComplaintEvent, SubmitComplaintState> {
  SubmitComplaintBloc() : super(const SubmitComplaintInitial()) {
    on<_SubmittingComplaint>(_onSubmittingComplaint);
  }

  Future<void> _onSubmittingComplaint(
    _SubmittingComplaint event,
    Emitter<SubmitComplaintState> emit,
  ) async {
    emit(const SubmitComplaintState.submitComplaintLoading());
    try {
      final int userId = await AuthStorageFunctions.getUserId();

      final SubmitReportResponseModel response =
          await ComplaintsServices.submitResponse(
            userId: userId,
            complaintsData: event.complaintsData,
          );

      emit(SubmitComplaintState.submitComplaintSuccess(response));
    } catch (e) {
      emit(SubmitComplaintState.submitComplaintError(e.toString()));
    }
  }
}
