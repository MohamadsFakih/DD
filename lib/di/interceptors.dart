import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final userGuid = getIt<CommonBloc>().state.loginResponse.guid;
    options.headers['UserGuid'] = userGuid;
    super.onRequest(options, handler);
  }
}
