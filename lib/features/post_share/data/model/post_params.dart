import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_params.freezed.dart';
part 'post_params.g.dart';

@freezed
class PostParams with _$PostParams {
  const factory PostParams({
    @Default("") String link,
  }) = _PostParams;

  factory PostParams.fromJson(Map<String, dynamic> json) =>
      _$PostParamsFromJson(json);
}

@freezed
class PostResponse with _$PostResponse {
  const factory PostResponse({
    @Default("") String status,
  }) = _PostResponse;

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);
}
