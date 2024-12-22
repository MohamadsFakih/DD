import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/contribute/domain/repository/contribute_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:digital_defender/core/utils/error/error.dart';

@injectable
class ContributeUseCase {
  ContributeUseCase(this._repository);
  final ContributeRepository _repository;

  Future<Either<Error, SendContentResponse>> submitPost(
          SendContentParams params) =>
      _repository.submitPost(params);
}
