import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/features/post_share/data/model/post_params.dart';
import 'package:digital_defender/features/post_share/domain/repository/post_repository.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostUseCase {
  PostUseCase(this._postRepository);
  final PostRepository _postRepository;
  Future<Either<Error, PostResponse>> postShare(PostParams params) =>
      _postRepository.postShare(params);

  Future<Either<Error, GetVideoResponse>> getVideo(GetVideoParams params) =>
      _postRepository.getVideo(params);
}
