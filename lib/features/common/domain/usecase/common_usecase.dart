import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/common/domain/repository/common_repository.dart';
import 'package:digital_defender/features/post_share/data/model/get_video_response.dart';
import 'package:injectable/injectable.dart';
import 'package:digital_defender/core/utils/error/error.dart';

@injectable
class CommonUseCase {
  CommonUseCase(this._repository);
  final CommonRepository _repository;
  Future<Either<Error, GetVideoResponse>> getVideo(int type, int socialType) =>
      _repository.getVideo(type, socialType);
}
