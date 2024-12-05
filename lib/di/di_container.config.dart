// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import '../features/post_share/data/repository/post_repository_impl.dart'
    as _i568;
import '../features/post_share/data/service/post_service.dart' as _i906;
import '../features/post_share/data/source/post_source.dart' as _i382;
import '../features/post_share/data/source/post_source_impl.dart' as _i854;
import '../features/post_share/domain/repository/post_repository.dart' as _i732;
import '../features/post_share/domain/usecase/post_usecase.dart' as _i992;
import '../features/post_share/presentation/bloc/post_bloc.dart' as _i913;
import '../features/quick_reply/data/remote/service/reply_service.dart'
    as _i686;
import '../features/quick_reply/data/remote/source/reply_source.dart' as _i350;
import '../features/quick_reply/data/remote/source/reply_source_impl.dart'
    as _i434;
import '../features/quick_reply/data/repository/reply_repository_impl.dart'
    as _i42;
import '../features/quick_reply/domain/repository/reply_repository.dart'
    as _i956;
import '../features/quick_reply/domain/usecase/reply_usecase.dart' as _i464;
import '../features/quick_reply/presentation/bloc/reply_bloc.dart' as _i27;
import 'app_module.dart' as _i460;

const String _dev = 'dev';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i974.Logger>(() => appModule.logger);
  gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
      () => appModule.navigatorKey);
  gh.lazySingleton<_i361.Dio>(() => appModule.dio);
  gh.singleton<String>(
    () => appModule.apiBaseDevUrl,
    instanceName: 'base_url',
    registerFor: {_dev},
  );
  gh.factory<_i906.PostService>(() => _i906.PostService(gh<_i361.Dio>()));
  gh.factory<_i686.ReplyService>(() => _i686.ReplyService(gh<_i361.Dio>()));
  gh.singleton<String>(
    () => appModule.apiBaseUrl,
    instanceName: 'base_url',
    registerFor: {_prod},
  );
  gh.factory<_i350.ReplySource>(
      () => _i434.ReplySourceImpl(gh<_i686.ReplyService>()));
  gh.factory<_i382.PostSource>(
      () => _i854.PostSourceImpl(gh<_i906.PostService>()));
  gh.factory<_i732.PostRepository>(
      () => _i568.PostRepositoryImpl(gh<_i382.PostSource>()));
  gh.factory<_i956.ReplyRepository>(
      () => _i42.ReplyRepositoryImpl(gh<_i350.ReplySource>()));
  gh.factory<_i992.PostUseCase>(
      () => _i992.PostUseCase(gh<_i732.PostRepository>()));
  gh.factory<_i913.PostBloc>(() => _i913.PostBloc(gh<_i992.PostUseCase>()));
  gh.factory<_i464.ReplyUseCase>(
      () => _i464.ReplyUseCase(gh<_i956.ReplyRepository>()));
  gh.factory<_i27.ReplyBloc>(() => _i27.ReplyBloc(gh<_i464.ReplyUseCase>()));
  return getIt;
}

class _$AppModule extends _i460.AppModule {}
