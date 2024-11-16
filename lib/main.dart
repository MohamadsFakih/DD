import 'package:digital_defender/core/utils/design/color_theme.dart';
import 'package:digital_defender/features/walkthrough/presentation/screens/walkthrough_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/utils/design/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = createTextTheme(context, "Inter", "Inter");

    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      theme: theme.light(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const WalkthroughScreen(),
    );
  }
}
