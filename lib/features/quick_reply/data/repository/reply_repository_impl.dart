import 'package:dartz/dartz.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/quick_reply/data/models/reply_params.dart';
import 'package:digital_defender/features/quick_reply/data/remote/source/reply_source.dart';
import 'package:digital_defender/features/quick_reply/domain/repository/reply_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ReplyRepository)
class ReplyRepositoryImpl implements ReplyRepository {
  ReplyRepositoryImpl(this._replySource);
  final ReplySource _replySource;
  @override
  Future<Either<Error, PostResponse>> quickReply(ReplyParams params) async {
    try {
      final res = await _replySource.quickReply(params);

      return right(res);
    } catch (e) {
      return left(
        Error.customErrorType(
          e.toString(),
        ),
      );
    }
  }
}
