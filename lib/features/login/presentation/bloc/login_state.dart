part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial({
    @Default(false) bool isLoading,
    @Default(LoginResponse()) LoginResponse loginResponse,
  }) = _Initial;
}
