import 'package:dartz/dartz.dart';
import 'package:digital_defender/core/utils/constants/secure_storage.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:digital_defender/features/login/data/remote/source/login_source.dart';
import 'package:digital_defender/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:digital_defender/core/utils/error/error.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
  Future<Either<Error, LoginResponse>> login(LoginParams params) async {
    try {
      final user = await loginDataSource.login(params);
      SecureStorage.saveLoginResponse(user);
      getIt<CommonBloc>().add(addUserData(user));
      return right(user);
    } catch (e) {
      return left(
        Error.customErrorType(
          e.toString(),
        ),
      );
    }
  }
}
