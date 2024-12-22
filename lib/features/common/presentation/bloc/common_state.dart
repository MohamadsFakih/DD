part of 'common_bloc.dart';

@freezed
class CommonState with _$CommonState {
  const factory CommonState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool success,
    @Default(GetVideoResponse()) GetVideoResponse videoResponse,
    @Default(LoginResponse()) LoginResponse loginResponse,
  }) = _Initial;
}
