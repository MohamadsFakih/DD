import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:digital_defender/features/login/data/remote/service/login_service.dart';
import 'package:digital_defender/features/login/data/remote/source/login_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: LoginSource)
class LoginSourceImpl implements LoginSource {
  LoginSourceImpl(this._loginService);
  final LoginService _loginService;
  @override
  Future<LoginResponse> login(LoginParams params) =>
      _loginService.login(params);
}
