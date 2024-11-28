import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:digital_defender/di/di_container.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies({String env = Environment.dev}) =>
    $initGetIt(getIt, environment: env);
