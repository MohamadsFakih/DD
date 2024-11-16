import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      surfaceTint: Color(0xff426834),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff517842),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff404d39),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff63725c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff215153),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff487577),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff97000a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2b27),
      onErrorContainer: Color(0xffffffff),
      surface: Colors.black,
      onSurface: Colors.white,
      onSurfaceVariant: Color(0xff454841),
      outline: Color(0xff757871),
      outlineVariant: Color(0xffc5c7bf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff31302f),
      inversePrimary: Color(0xffa7d393),
      primaryFixed: Color(0xffc2efad),
      onPrimaryFixed: Color(0xff042100),
      primaryFixedDim: Color(0xffa7d393),
      onPrimaryFixedVariant: Color(0xff2b4f1e),
      secondaryFixed: Color(0xffd8e7cd),
      onSecondaryFixed: Color(0xff121f0e),
      secondaryFixedDim: Color(0xffbccbb2),
      onSecondaryFixedVariant: Color(0xff3d4b37),
      tertiaryFixed: Color(0xffbbebed),
      onTertiaryFixed: Color(0xff002021),
      tertiaryFixedDim: Color(0xffa0cfd1),
      onTertiaryFixedVariant: Color(0xff1e4e50),
      surfaceDim: Color(0xffdcd9d7),
      surfaceBright: Color(0xfffcf9f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f1),
      surfaceContainer: Color(0xfff0edeb),
      surfaceContainerHigh: Color(0xffeae8e5),
      surfaceContainerHighest: Color(0xffe5e2e0),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff274b1b),
      surfaceTint: Color(0xff426834),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff517842),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff394733),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff63725c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff194a4c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff487577),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0008),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2b27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf9f6),
      onSurface: Color(0xff1c1c1a),
      onSurfaceVariant: Color(0xff41443e),
      outline: Color(0xff5d6059),
      outlineVariant: Color(0xff797c74),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff31302f),
      inversePrimary: Color(0xffa7d393),
      primaryFixed: Color(0xff577f48),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3f6532),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6a7963),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff52604b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4e7c7e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff356365),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9d7),
      surfaceBright: Color(0xfffcf9f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f1),
      surfaceContainer: Color(0xfff0edeb),
      surfaceContainerHigh: Color(0xffeae8e5),
      surfaceContainerHighest: Color(0xffe5e2e0),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff052900),
      surfaceTint: Color(0xff426834),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff274b1b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff192514),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff394733),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002729),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff194a4c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0008),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf9f6),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff22251f),
      outline: Color(0xff41443e),
      outlineVariant: Color(0xff41443e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff31302f),
      inversePrimary: Color(0xffccf9b6),
      primaryFixed: Color(0xff274b1b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff103406),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff394733),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff23301e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff194a4c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003334),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdcd9d7),
      surfaceBright: Color(0xfffcf9f6),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f3f1),
      surfaceContainer: Color(0xfff0edeb),
      surfaceContainerHigh: Color(0xffeae8e5),
      surfaceContainerHighest: Color(0xffe5e2e0),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Colors.white,
      surfaceTint: Color(0xffa7d393),
      onPrimary: Color(0xff143809),
      primaryContainer: Color(0xff395e2b),
      onPrimaryContainer: Color(0xffebffdc),
      secondary: Color(0xffBCCBB1),
      onSecondary: Color(0xff273422),
      secondaryContainer: Color(0xff3D4B36),
      onSecondaryContainer: Color(0xffecfce0),
      tertiary: Color(0xffa0cfd1),
      onTertiary: Color(0xff003739),
      tertiaryContainer: Color(0xff2d5c5e),
      onTertiaryContainer: Color(0xffe0feff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690004),
      errorContainer: Color(0xffad0d12),
      onErrorContainer: Color(0xfffff9f8),
      surface: Color(0xff181A1A),
      onSurface: Colors.black,
      onSurfaceVariant: Color(0xffc5c7bf),
      outline: Color(0xff8f928a),
      outlineVariant: Color(0xff454841),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e0),
      inversePrimary: Color(0xff426834),
      primaryFixed: Color(0xffc2efad),
      onPrimaryFixed: Color(0xff042100),
      primaryFixedDim: Color(0xffa7d393),
      onPrimaryFixedVariant: Color(0xff2b4f1e),
      secondaryFixed: Color(0xffd8e7cd),
      onSecondaryFixed: Color(0xff121f0e),
      secondaryFixedDim: Color(0xffbccbb2),
      onSecondaryFixedVariant: Color(0xff3d4b37),
      tertiaryFixed: Color(0xffbbebed),
      onTertiaryFixed: Color(0xff002021),
      tertiaryFixedDim: Color(0xffa0cfd1),
      onTertiaryFixedVariant: Color(0xff1e4e50),
      surfaceDim: Color(0xff131312),
      surfaceBright: Color(0xff393938),
      surfaceContainerLowest: Color(0xff0e0e0d),
      surfaceContainerLow: Color(0xff1c1c1a),
      surfaceContainer: Color(0xff232538),
      surfaceContainerHigh: Color(0xff2a2a29),
      surfaceContainerHighest: Color(0xff353533),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffabd797),
      surfaceTint: Color(0xffa7d393),
      onPrimary: Color(0xff143809),
      primaryContainer: Color(0xff739c62),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffc0cfb6),
      onSecondary: Color(0xff0d1909),
      secondaryContainer: Color(0xff86957e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffa4d3d5),
      onTertiary: Color(0xff001a1b),
      tertiaryContainer: Color(0xff6b999b),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131312),
      onSurface: Color(0xffE1E4DA),
      onSurfaceVariant: Color(0xffcaccc3),
      outline: Color(0xffa1a49c),
      outlineVariant: Color(0xff81847d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e0),
      inversePrimary: Color(0xff2c511f),
      primaryFixed: Color(0xffc2efad),
      onPrimaryFixed: Color(0xff021500),
      primaryFixedDim: Color(0xffa7d393),
      onPrimaryFixedVariant: Color(0xff1a3e0f),
      secondaryFixed: Color(0xffd8e7cd),
      onSecondaryFixed: Color(0xff081405),
      secondaryFixedDim: Color(0xffbccbb2),
      onSecondaryFixedVariant: Color(0xff2d3a27),
      tertiaryFixed: Color(0xffbbebed),
      onTertiaryFixed: Color(0xff001415),
      tertiaryFixedDim: Color(0xffa0cfd1),
      onTertiaryFixedVariant: Color(0xff063d3f),
      surfaceDim: Color(0xff131312),
      surfaceBright: Color(0xff393938),
      surfaceContainerLowest: Color(0xff0e0e0d),
      surfaceContainerLow: Color(0xff1c1c1a),
      surfaceContainer: Color(0xff20201e),
      surfaceContainerHigh: Color(0xff2a2a29),
      surfaceContainerHighest: Color(0xff353533),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff2ffe6),
      surfaceTint: Color(0xffa7d393),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffabd797),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff2ffe7),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc0cfb6),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffebffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa4d3d5),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131312),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffafcf2),
      outline: Color(0xffcaccc3),
      outlineVariant: Color(0xffcaccc3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e0),
      inversePrimary: Color(0xff0d3104),
      primaryFixed: Color(0xffc7f3b1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffabd797),
      onPrimaryFixedVariant: Color(0xff031b00),
      secondaryFixed: Color(0xffdcecd1),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc0cfb6),
      onSecondaryFixedVariant: Color(0xff0d1909),
      tertiaryFixed: Color(0xffbff0f2),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa4d3d5),
      onTertiaryFixedVariant: Color(0xff001a1b),
      surfaceDim: Color(0xff131312),
      surfaceBright: Color(0xff393938),
      surfaceContainerLowest: Color(0xff0e0e0d),
      surfaceContainerLow: Color(0xff1c1c1a),
      surfaceContainer: Color(0xff20201e),
      surfaceContainerHigh: Color(0xff2a2a29),
      surfaceContainerHighest: Color(0xff353533),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

// const darkTheme = ColorScheme.dark(
// primary: Color(0xFFA7D394),
// primaryContainer: Color(0xFF2C4F1F),
// primaryFixed: Color(0xFFC2EFAE),
// primaryFixedDim: Color(0xFFA7D394),
// onPrimary: Color(0xFF153809),
// onPrimaryFixed: Color(0xFF032100),
// onPrimaryFixedVariant: Color(0xFF2B4F1F),
// onPrimaryContainer: Color(0xFFC2EFAE),
// secondary: Color(0xFF273421),
// secondaryContainer: Color(0xFF3D4B36),
// secondaryFixed: Color(0xFFD8E7CD),
// secondaryFixedDim: Color(0xFFBCCBB0),
// onSecondary: Color(0xFFBCCBB0),
// onSecondaryFixed: Color(0xFF121F0E),
// onSecondaryFixedVariant: Color(0xFF3D4B36),
// onSecondaryContainer: Color(0xFFD8E7CC),
// tertiary: Color(0xFF91CBF5),
// tertiaryContainer: Color(0xFF1E4E51),
// tertiaryFixed: Color(0xFFBCEBED),
// tertiaryFixedDim: Color(0xFFA0CFD1),
// onTertiary: Color(0xFF00373A),
// onTertiaryFixed: Color(0xFF002021),
// onTertiaryFixedVariant: Color(0xFF1E4E50),
// onTertiaryContainer: Color(0xFFBCEBED),
// surface: Color(0xFF181A1A),
// surfaceDim: Color(0xFF11140F),
// surfaceBright: Color(0xFF373A33),
// surfaceContainerLowest: Color(0xFF0C0F0A),
// surfaceContainerLow: Color(0xFF191D17),
// surfaceContainer: Color(0xFF232538),
// surfaceContainerHigh: Color(0xFF272B25),
// surfaceContainerHighest: Color(0xFF32362F),
// onSurface: Color(0xFFE1E4DA),
// onSurfaceVariant: Color(0xFFC3C8BC),
// onInverseSurface: Color(0xFF2E322B),
// inverseSurface: Color(0xFFE1E4DA),
// inversePrimary: Color(0xFF426834),
// error: Color(0xFFFFB4AB),
// errorContainer: Color(0xFF93000A),
// onError: Color(0xFF690005),
// onErrorContainer: Color(0xFFFFDAD6),
// outline: Color(0xFFA3A6A1),
// outlineVariant: Color(0xFF43483F),
// scrim: Colors.black,
// shadow: Colors.black,
// );
//
// const lightTheme = ColorScheme.light(
// primary: Color(0xFF426834),
// primaryContainer: Color(0xFFC2EFAE),
// primaryFixed: Color(0xFFC2EFAE),
// primaryFixedDim: Color(0xFFA7D394),
// onPrimaryFixed: Color(0xFF032100),
// onPrimaryFixedVariant: Color(0xFF2B4F1F),
// onPrimaryContainer: Color(0xFF032100),
// secondary: Color(0xFF54624D),
// secondaryContainer: Color(0xFFD8E7CC),
// secondaryFixed: Color(0xFFD8E7CD),
// secondaryFixedDim: Color(0xFFBCCBB0),
// onSecondary: Colors.white,
// onSecondaryFixed: Color(0xFF121F0E),
// onSecondaryFixedVariant: Color(0xFF3D4B36),
// onSecondaryContainer: Color(0xFF121F0E),
// tertiary: Color(0xFF386668),
// tertiaryContainer: Color(0xFFBCEBED),
// tertiaryFixed: Color(0xFFBCEBED),
// tertiaryFixedDim: Color(0xFFA0CFD1),
// onTertiary: Colors.white,
// onTertiaryFixed: Color(0xFF002021),
// onTertiaryFixedVariant: Color(0xFF1E4E50),
// onTertiaryContainer: Color(0xFF002021),
// surface: Color(0xFFF8FAF0),
// surfaceDim: Color(0xFFD8DBD1),
// surfaceBright: Color(0xFFF8FAF0),
// surfaceContainerLowest: Colors.white,
// surfaceContainerLow: Color(0xFFF2F5EB),
// surfaceContainer: Color(0xFFECEFE5),
// surfaceContainerHigh: Color(0xFFE7E9DF),
// surfaceContainerHighest: Color(0xFFE1E4DA),
// onSurface: Color(0xFF191D17),
// onSurfaceVariant: Color(0xFF43483F),
// onInverseSurface: Color(0xFFEFF2E8),
// inverseSurface: Color(0xFF2E322B),
// inversePrimary: Color(0xFFA7D394),
// error: Color(0xFFBA1A1A),
// errorContainer: Color(0xFFFFDAD6),
// onErrorContainer: Color(0xFF410002),
// outline: Color(0xFF73796E),
// outlineVariant: Color(0xFFC3C8BC),
// scrim: Colors.black,
// shadow: Colors.black,
// );
//
// const textTheme = TextTheme();
