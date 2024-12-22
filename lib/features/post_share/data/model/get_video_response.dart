import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_video_response.freezed.dart';
part 'get_video_response.g.dart';

@freezed
class GetVideoResponse with _$GetVideoResponse {
  const factory GetVideoResponse({
    @Default("") String link,
    @Default("") String embed,
    @Default("") String content,
    @Default(0) int postType,
    @Default(0) int socialType,
    @Default("") String attachment,
    @Default("") String guid,
  }) = _GetVideoResponse;

  factory GetVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVideoResponseFromJson(json);
}
