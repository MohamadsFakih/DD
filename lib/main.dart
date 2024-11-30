import 'package:digital_defender/core/utils/design/color_theme.dart';
import 'package:digital_defender/di/di_container.dart';
import 'package:digital_defender/features/default/presentation/screens/default_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/utils/constants/app_constants.dart';
import 'core/utils/design/text_theme.dart';

void main() {
  //! Change the environment between prod and dev
  const String env = Environment.dev;
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(env, instanceName: 'env');
  configureDependencies(env: env);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = createTextTheme(context, "Inter", "Inter");

    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.light(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DefaultScreen(),
    );
  }
}