import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';

abstract class ReplyRepository {
  Future<Either<Error, PostResponse>> quickReply(ReplyParams params);
}
