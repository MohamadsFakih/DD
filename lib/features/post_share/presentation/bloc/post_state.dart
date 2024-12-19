part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial({
    @Default(false) bool isLoading,
    @Default(PostResponse()) PostResponse postResponse,
  }) = _Initial;
}
