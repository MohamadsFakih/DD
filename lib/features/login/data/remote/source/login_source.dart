import 'package:digital_defender/features/login/data/models/login_params.dart';

abstract class LoginSource {
  Future<LoginResponse> login(LoginParams params);
}
