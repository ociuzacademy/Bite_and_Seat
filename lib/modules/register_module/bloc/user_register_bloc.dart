import 'package:bite_and_seat/modules/register_module/class/register_data.dart';
import 'package:bite_and_seat/modules/register_module/models/register_response_model.dart';
import 'package:bite_and_seat/modules/register_module/services/register_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_register_event.dart';
part 'user_register_state.dart';
part 'user_register_bloc.freezed.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc() : super(const UserRegisterInitial()) {
    on<_UserRegister>(_onUserRegister);
  }

  Future<void> _onUserRegister(
    _UserRegister event,
    Emitter<UserRegisterState> emit,
  ) async {
    emit(const UserRegisterState.loading());
    try {
      final RegisterResponseModel response = await RegisterService.userRegister(
        data: event.data,
      );
      emit(UserRegisterState.success(response));
    } catch (e) {
      emit(UserRegisterState.error(e.toString()));
    }
  }
}
