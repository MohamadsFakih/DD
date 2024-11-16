import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  final TextTheme baseTextTheme = Theme.of(context).textTheme;
  final TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  final TextTheme textTheme = displayTextTheme.copyWith(
    displayLarge: const TextStyle(fontSize: 57, fontWeight: FontWeight.w400),
    displayMedium: const TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
    displaySmall: const TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
    headlineLarge: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
    headlineMedium: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
    headlineSmall: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
    titleLarge: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    titleSmall: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLarge: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmall: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    labelLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    labelMedium: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    labelSmall: const TextStyle(fontSize: 11, fontWeight: FontWeight.w200),
  );
  return textTheme;
}
