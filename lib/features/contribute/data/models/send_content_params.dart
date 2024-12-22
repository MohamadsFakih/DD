import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_content_params.freezed.dart';
part 'send_content_params.g.dart';

@freezed
class SendContentParams with _$SendContentParams {
  const factory SendContentParams({
    @Default("") String link,
    @Default("") String attachment,
    @Default(0) int socialType,
    @Default([]) List<String> comments,
    @Default("") String ipAddress,
    @Default("") String userAgent,
  }) = _SendContentParams;

  factory SendContentParams.fromJson(Map<String, dynamic> json) =>
      _$SendContentParamsFromJson(json);
}

@freezed
class SendContentResponse with _$SendContentResponse {
  const factory SendContentResponse({
    @Default(false)bool success,
  }) = _SendContentResponse;



  factory SendContentResponse.fromJson(Map<String, dynamic> json) =>
      _$SendContentResponseFromJson(json);
}