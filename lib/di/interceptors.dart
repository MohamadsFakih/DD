// import 'package:dio/dio.dart';
// import 'package:saawt/core/user/bloc/user_bloc.dart';
// import 'package:saawt/di/di_container.dart';
//
// class AuthInterceptor extends Interceptor {
//   @override
//   Future<void> onRequest(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     final token = getIt<UserBloc>().state.userInfo.authToken;
//     options.headers['authorization'] = "Bearer $token";
//     super.onRequest(options, handler);
//   }
// }
