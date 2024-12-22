import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/core/utils/error/error.dart';

abstract class PostRepository {
  Future<Either<Error, PostResponse>> postShare(PostParams params);
}
