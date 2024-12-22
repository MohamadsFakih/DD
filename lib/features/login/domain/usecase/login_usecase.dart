import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:digital_defender/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:digital_defender/core/utils/error/error.dart';

@injectable
class LoginUseCase {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  Future<Either<Error, LoginResponse>> login(LoginParams params) =>
      _loginRepository.login(params);
}
