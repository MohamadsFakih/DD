import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:digital_defender/features/quick_reply/domain/repository/reply_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReplyUseCase {
  ReplyUseCase(this._repository);
  final ReplyRepository _repository;
  Future<Either<Error, PostResponse>> quickReply(ReplyParams params) =>
      _repository.quickReply(params);
}
