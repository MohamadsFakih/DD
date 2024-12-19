import 'package:dartz/dartz.dart';
import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:digital_defender/core/utils/error/error.dart';

abstract class LoginRepository {
  Future<Either<Error, LoginResponse>> login(LoginParams params);
}
