part of 'common_bloc.dart';

@freezed
class CommonEvent with _$CommonEvent {
  const factory CommonEvent.getVideo(int type, int socialType) = GetVideo;
}
