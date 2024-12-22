import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/common/data/models/send_activity_params.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:digital_defender/core/utils/error/error.dart';

abstract class CommonRepository {
  Future<Either<Error, GetVideoResponse>> getVideo(int type, int socialType);
  Future<Either<Error, SendContentResponse>> sendActivity(
      SendActivityParams params);
}
