part of 'post_bloc.dart';

@freezed
class PostEvent with _$PostEvent {
  const factory PostEvent.postVideo(String link) = PostVideo;
  const factory PostEvent.getVideo(GetVideoParams params) = GetVideo;
}
