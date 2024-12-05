import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_video_params.freezed.dart';
part 'get_video_params.g.dart';

@freezed
class GetVideoParams with _$GetVideoParams {
  const factory GetVideoParams({
    @Default("") String platform,
    @Default("") String type,
  }) = _GetVideoParams;

  factory GetVideoParams.fromJson(Map<String, dynamic> json) =>
      _$GetVideoParamsFromJson(json);
}
