import 'package:dartz/dartz.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:digital_defender/features/common/data/models/send_activity_params.dart';
import 'package:digital_defender/features/common/data/remote/source/common_source.dart';
import 'package:digital_defender/features/common/domain/repository/common_repository.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CommonRepository)
class CommonRepositoryImpl implements CommonRepository {
  CommonRepositoryImpl(this._commonSource);
  final CommonSource _commonSource;
  @override
  Future<Either<Error, GetVideoResponse>> getVideo(
      int type, int socialType) async {
    try {
      final res = await _commonSource.getVideo(type, socialType);
      return right(res);
    } catch (e) {
      return left(
        Error.customErrorType(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Error, SendContentResponse>> sendActivity(
      SendActivityParams params) async {
    try {
      final res = await _commonSource.sendActivity(params);
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
