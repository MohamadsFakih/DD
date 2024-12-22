import 'dart:convert';

import 'package:digital_defender/core/utils/constants/api_constants.dart';
import 'package:digital_defender/features/common/data/remote/service/common_service.dart';
import 'package:digital_defender/features/common/data/remote/source/common_source_impl.dart';
import 'package:digital_defender/features/common/data/repository/common_repository_impl.dart';
import 'package:digital_defender/features/common/domain/usecase/common_usecase.dart';
import 'package:digital_defender/features/common/presentation/bloc/common_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'di_container.dart';

@module
abstract class AppModule {
  /// The key provided to the material app widget
  /// which provide a [NavigatorState] to handle navigation.
  ///
  @singleton
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  Logger get logger => Logger(printer: JsonPrettyPrinter(lineLength: 800));

  /// The url for the production environemnt
  @Named('base_url')
  @Singleton(env: [Environment.prod])
  String get apiBaseUrl => APIConstant.baseUrl;

  /// The url for the development environment
  @Named('base_url')
  @Singleton(env: [Environment.dev])
  String get apiBaseDevUrl => APIConstant.devUrl;

  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: getIt.get<String>(instanceName: 'base_url'),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // dio.interceptors.add(
    //   LogInterceptor(
    //     request: false,
    //     requestBody: true,
    //     responseBody: true,
    //     responseHeader: false,
    //     logPrint: (obj) => logger.d(obj),
    //   ),
    // );

    return dio;
  }

  @lazySingleton
  CommonBloc get playerBloc => CommonBloc(
        CommonUseCase(
          CommonRepositoryImpl(
            CommonSourceImpl(
              CommonService(dio),
            ),
          ),
        ),
      );
}

// Custom PrettyPrinter to handle JSON formatting
class JsonPrettyPrinter extends PrettyPrinter {
  JsonPrettyPrinter({super.lineLength = 400});

  @override
  List<String> log(LogEvent event) {
    var message = event.message;
    try {
      // Try to format JSON if the message is a valid JSON string
      final jsonObject = json.decode(message.toString());
      message = const JsonEncoder.withIndent('  ').convert(jsonObject);
    } catch (e) {
      // If it's not JSON, print the message as usual
    }
    return super.log(
      LogEvent(
        event.level,
        message,
        error: event.error,
        stackTrace: event.stackTrace,
      ),
    );
  }
}
