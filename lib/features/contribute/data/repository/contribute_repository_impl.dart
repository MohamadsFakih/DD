import 'package:dartz/dartz.dart';
import 'package:digital_defender/core/utils/error/error.dart';
import 'package:digital_defender/features/contribute/data/models/send_content_params.dart';
import 'package:digital_defender/features/contribute/data/remote/source/contribute_source.dart';
import 'package:digital_defender/features/contribute/domain/repository/contribute_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ContributeRepository)
class ContributeRepositoryImpl implements ContributeRepository {
  ContributeRepositoryImpl(this._contributeSource);
  final ContributeSource _contributeSource;
  @override
  Future<Either<Error, SendContentResponse>> submitPost(
      SendContentParams params) async {
    try {
      final res = await _contributeSource.submitPost(params);

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
