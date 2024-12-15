import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reply_params.freezed.dart';
part 'reply_params.g.dart';

@freezed
class ReplyParams with _$ReplyParams {
  const factory ReplyParams({
    @Default("") String image,
  }) = _ReplyParams;

  factory ReplyParams.fromJson(Map<String, dynamic> json) =>
      _$ReplyParamsFromJson(json);
}
