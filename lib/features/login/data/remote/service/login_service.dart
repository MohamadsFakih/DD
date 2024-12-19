import 'package:digital_defender/core/utils/constants/api_constants.dart';
import 'package:digital_defender/features/login/data/models/login_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'login_service.g.dart';

/// The contract for the login remote service.
/// This represent the blue print for the service.
@RestApi()
@injectable
abstract class LoginService {
  @factoryMethod
  factory LoginService(Dio dio) {
    // dio.interceptors.add(AuthInterceptor());
    return _LoginService(dio);
  }

  @POST(APIConstant.login)
  Future<LoginResponse> login(@Body() LoginParams params);
}
