part of 'common_bloc.dart';

@freezed
class CommonEvent with _$CommonEvent {
  const factory CommonEvent.getVideo(int type, int socialType) = GetVideo;
  const factory CommonEvent.sendActivity(SendActivityParams params) =
      SendActivity;
  const factory CommonEvent.addUserData(LoginResponse loginResponse) =
      addUserData;
}
