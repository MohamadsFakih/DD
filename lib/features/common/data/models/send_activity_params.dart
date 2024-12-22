import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_activity_params.freezed.dart';
part 'send_activity_params.g.dart';

@freezed
class SendActivityParams with _$SendActivityParams {
  const factory SendActivityParams({
    @Default("") String link,
    @Default(0) int socialType,
    @Default(0) int type,
  }) = _SendActivityParams;

  factory SendActivityParams.fromJson(Map<String, dynamic> json) =>
      _$SendActivityParamsFromJson(json);
}
