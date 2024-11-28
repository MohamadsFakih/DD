import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_video_response.freezed.dart';
part 'get_video_response.g.dart';

@freezed
class GetVideoResponse with _$GetVideoResponse {
  const factory GetVideoResponse({
    @Default("") String link,
  }) = _GetVideoResponse;

  factory GetVideoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVideoResponseFromJson(json);
}
