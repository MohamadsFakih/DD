import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/core/utils/error/error.dart';

abstract class CommonRepository {
  Future<Either<Error, GetVideoResponse>> getVideo(int type, int socialType);
}