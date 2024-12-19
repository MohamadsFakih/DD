import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['UserGuid'] = "6304049b-cc8b-4f5f-a7a0-1354b80dafa2";
    super.onRequest(options, handler);
  }
}
