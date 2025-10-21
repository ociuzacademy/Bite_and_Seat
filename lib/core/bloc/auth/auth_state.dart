part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.authLoading() = AuthLoading;
  const factory AuthState.authError(String errorMessage) = AuthError;
  const factory AuthState.loginSuccess(LoginModel response) = LoginSuccess;
  const factory AuthState.logoutSuccess() = LogoutSuccess;
}
