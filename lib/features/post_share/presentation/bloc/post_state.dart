part of 'post_bloc.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial({
    @Default(false) bool isLoading,
    @Default(false) bool isVideoLoading,
    @Default("") String videoLink,
    @Default(PostResponse()) PostResponse postResponse,
    @Default(GetVideoResponse()) GetVideoResponse getVideoResponse,
  }) = _Initial;
}
