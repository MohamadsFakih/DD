import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/core/utils/error/error.dart';

abstract class ContributeRepository {
  Future<Either<Error, SendContentResponse>> submitPost(
      SendContentParams params);
}
