part of 'user_register_bloc.dart';

@freezed
sealed class UserRegisterState with _$UserRegisterState {
  const factory UserRegisterState.initial() = UserRegisterInitial;
  const factory UserRegisterState.loading() = UserRegisterLoading;
  const factory UserRegisterState.success(RegisterResponseModel response) =
      UserRegisterSuccess;
  const factory UserRegisterState.error(String error) = UserRegisterError;
}
