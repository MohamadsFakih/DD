part of 'contribute_bloc.dart';

@freezed
class ContributeState with _$ContributeState {
  const factory ContributeState.initial({
    @Default(false) bool isLoading,
  }) = _Initial;
}
