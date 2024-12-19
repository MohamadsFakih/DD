import 'package:dartz/dartz.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/post_share/data/source/post_source.dart';
import 'package:digital_defender/features/post_share/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this._postSource);
  final PostSource _postSource;
  @override
  Future<Either<Error, PostResponse>> postShare(PostParams params) async {
    try {
      final res = await _postSource.postShare(params);

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
