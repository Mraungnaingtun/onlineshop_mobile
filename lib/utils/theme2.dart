import 'package:flutter/material.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xFF8C9EFF),
      surfaceTint: Color(0xFF8C9EFF),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF536DFE),
      onPrimaryContainer: Color(0xFF000C66),
      secondary: Color(0xFF8C9EFF),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFF536DFE),
      onSecondaryContainer: Color(0xFF000C66),
      tertiary: Color(0xFFBB86FC),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF6200EE),
      onTertiaryContainer: Color(0xFF3700B3),
      error: Color(0xFFCF6679),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFB00020),
      onErrorContainer: Color(0xFF3700B3),
      background: Color(0xFFFFFBFE),
      onBackground: Color(0xFF1C1B1F),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      surfaceVariant: Color(0xFFE7E0EC),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      inverseOnSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFF3700B3),
      primaryFixed: Color(0xFF6200EE),
      onPrimaryFixed: Color(0xFFFFFFFF),
      primaryFixedDim: Color(0xFFBB86FC),
      onPrimaryFixedVariant: Color(0xFF3700B3),
      secondaryFixed: Color(0xFF03DAC5),
      onSecondaryFixed: Color(0xFF000000),
      secondaryFixedDim: Color(0xFF018786),
      onSecondaryFixedVariant: Color(0xFF03DAC5),
      tertiaryFixed: Color(0xFFBB86FC),
      onTertiaryFixed: Color(0xFFFFFFFF),
      tertiaryFixedDim: Color(0xFF6200EE),
      onTertiaryFixedVariant: Color(0xFF3700B3),
      surfaceDim: Color(0xFFF1F0F4),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF7F2FA),
      surfaceContainer: Color(0xFFFBF8FD),
      surfaceContainerHigh: Color(0xFFF4EFF4),
      surfaceContainerHighest: Color(0xFFEDE4F3),
    );
  }

  static ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFBB86FC),
      surfaceTint: Color(0xFFBB86FC),
      onPrimary: Color(0xFF000000),
      primaryContainer: Color(0xFF3700B3),
      onPrimaryContainer: Color(0xFFBB86FC),
      secondary: Color(0xFF03DAC5),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFF018786),
      onSecondaryContainer: Color(0xFF03DAC5),
      tertiary: Color(0xFF6200EE),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFF3700B3),
      onTertiaryContainer: Color(0xFF6200EE),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      errorContainer: Color(0xFFB00020),
      onErrorContainer: Color(0xFFCF6679),
      background: Color(0xFF121212),
      onBackground: Color(0xFFE6E1E5),
      surface: Color(0xFF121212),
      onSurface: Color(0xFFE6E1E5),
      surfaceVariant: Color(0xFF49454F),
      onSurfaceVariant: Color(0xFFE7E0EC),
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E1E5),
      inverseOnSurface: Color(0xFF313033),
      inversePrimary: Color(0xFFBB86FC),
      primaryFixed: Color(0xFF3700B3),
      onPrimaryFixed: Color(0xFFBB86FC),
      primaryFixedDim: Color(0xFF6200EE),
      onPrimaryFixedVariant: Color(0xFF3700B3),
      secondaryFixed: Color(0xFF018786),
      onSecondaryFixed: Color(0xFF03DAC5),
      secondaryFixedDim: Color(0xFF03DAC5),
      onSecondaryFixedVariant: Color(0xFF018786),
      tertiaryFixed: Color(0xFF6200EE),
      onTertiaryFixed: Color(0xFFFFFFFF),
      tertiaryFixedDim: Color(0xFFBB86FC),
      onTertiaryFixedVariant: Color(0xFF3700B3),
      surfaceDim: Color(0xFF1E1E1E),
      surfaceBright: Color(0xFF121212),
      surfaceContainerLowest: Color(0xFF121212),
      surfaceContainerLow: Color(0xFF181818),
      surfaceContainer: Color(0xFF1C1C1C),
      surfaceContainerHigh: Color(0xFF222222),
      surfaceContainerHighest: Color(0xFF2C2C2C),
    );
  }

  static ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: ThemeData.light().textTheme.apply(
            bodyColor: colorScheme.onSurface,
            displayColor: colorScheme.onSurface,
          ),
      scaffoldBackgroundColor: colorScheme.background,
      canvasColor: colorScheme.surface,
    );
  }
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;

  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}
