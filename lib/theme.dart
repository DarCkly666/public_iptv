import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286598520),
      surfaceTint: Color(4286598520),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957044),
      onPrimaryContainer: Color(4281600049),
      secondary: Color(4285421672),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294499054),
      onSecondaryContainer: Color(4280751652),
      tertiary: Color(4287580751),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957786),
      onTertiaryContainer: Color(4282058768),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965241),
      onSurface: Color(4280293918),
      onSurfaceVariant: Color(4283319371),
      outline: Color(4286608507),
      outlineVariant: Color(4291936971),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inversePrimary: Color(4294095845),
      primaryFixed: Color(4294957044),
      onPrimaryFixed: Color(4281600049),
      primaryFixedDim: Color(4294095845),
      onPrimaryFixedVariant: Color(4284888415),
      secondaryFixed: Color(4294499054),
      onSecondaryFixed: Color(4280751652),
      secondaryFixedDim: Color(4292591570),
      onSecondaryFixedVariant: Color(4283777104),
      tertiaryFixed: Color(4294957786),
      onTertiaryFixed: Color(4282058768),
      tertiaryFixedDim: Color(4294947766),
      onTertiaryFixedVariant: Color(4285674296),
      surfaceDim: Color(4293122013),
      surfaceBright: Color(4294965241),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832374),
      surfaceContainer: Color(4294437617),
      surfaceContainerHigh: Color(4294108651),
      surfaceContainerHighest: Color(4293713893),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284625243),
      surfaceTint: Color(4286598520),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288242320),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283514188),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286934655),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285411124),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289355620),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965241),
      onSurface: Color(4280293918),
      onSurfaceVariant: Color(4283056199),
      outline: Color(4284963939),
      outlineVariant: Color(4286871423),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inversePrimary: Color(4294095845),
      primaryFixed: Color(4288242320),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286466678),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286934655),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285224294),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289355620),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287383372),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293122013),
      surfaceBright: Color(4294965241),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832374),
      surfaceContainer: Color(4294437617),
      surfaceContainerHigh: Color(4294108651),
      surfaceContainerHighest: Color(4293713893),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282126392),
      surfaceTint: Color(4286598520),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284625243),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281212203),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283514188),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282650390),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285411124),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965241),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280951080),
      outline: Color(4283056199),
      outlineVariant: Color(4283056199),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281675315),
      inversePrimary: Color(4294960630),
      primaryFixed: Color(4284625243),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282915652),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283514188),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281935670),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285411124),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283570464),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293122013),
      surfaceBright: Color(4294965241),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294832374),
      surfaceContainer: Color(4294437617),
      surfaceContainerHigh: Color(4294108651),
      surfaceContainerHighest: Color(4293713893),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294095845),
      surfaceTint: Color(4294095845),
      onPrimary: Color(4283178824),
      primaryContainer: Color(4284888415),
      onPrimaryContainer: Color(4294957044),
      secondary: Color(4292591570),
      onSecondary: Color(4282198841),
      secondaryContainer: Color(4283777104),
      onSecondaryContainer: Color(4294499054),
      tertiary: Color(4294947766),
      onTertiary: Color(4283833635),
      tertiaryContainer: Color(4285674296),
      onTertiaryContainer: Color(4294957786),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279702038),
      onSurface: Color(4293713893),
      onSurfaceVariant: Color(4291936971),
      outline: Color(4288318869),
      outlineVariant: Color(4283319371),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293713893),
      inversePrimary: Color(4286598520),
      primaryFixed: Color(4294957044),
      onPrimaryFixed: Color(4281600049),
      primaryFixedDim: Color(4294095845),
      onPrimaryFixedVariant: Color(4284888415),
      secondaryFixed: Color(4294499054),
      onSecondaryFixed: Color(4280751652),
      secondaryFixedDim: Color(4292591570),
      onSecondaryFixedVariant: Color(4283777104),
      tertiaryFixed: Color(4294957786),
      onTertiaryFixed: Color(4282058768),
      tertiaryFixedDim: Color(4294947766),
      onTertiaryFixedVariant: Color(4285674296),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279372817),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557090),
      surfaceContainerHigh: Color(4281280557),
      surfaceContainerHighest: Color(4282004279),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294424553),
      surfaceTint: Color(4294095845),
      onPrimary: Color(4281205548),
      primaryContainer: Color(4290281133),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292854742),
      onSecondary: Color(4280357150),
      secondaryContainer: Color(4288907675),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949307),
      onTertiary: Color(4281598731),
      tertiaryContainer: Color(4291459711),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279702038),
      onSurface: Color(4294965754),
      onSurfaceVariant: Color(4292265935),
      outline: Color(4289568679),
      outlineVariant: Color(4287398023),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293713893),
      inversePrimary: Color(4284954465),
      primaryFixed: Color(4294957044),
      onPrimaryFixed: Color(4280746021),
      primaryFixedDim: Color(4294095845),
      onPrimaryFixedVariant: Color(4283639118),
      secondaryFixed: Color(4294499054),
      onSecondaryFixed: Color(4279962649),
      secondaryFixedDim: Color(4292591570),
      onSecondaryFixedVariant: Color(4282593343),
      tertiaryFixed: Color(4294957786),
      onTertiaryFixed: Color(4281073670),
      tertiaryFixedDim: Color(4294947766),
      onTertiaryFixedVariant: Color(4284359464),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279372817),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557090),
      surfaceContainerHigh: Color(4281280557),
      surfaceContainerHighest: Color(4282004279),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965754),
      surfaceTint: Color(4294095845),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294424553),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965754),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292854742),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949307),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279702038),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965754),
      outline: Color(4292265935),
      outlineVariant: Color(4292265935),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293713893),
      inversePrimary: Color(4282718273),
      primaryFixed: Color(4294958581),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294424553),
      onPrimaryFixedVariant: Color(4281205548),
      secondaryFixed: Color(4294762226),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292854742),
      onSecondaryFixedVariant: Color(4280357150),
      tertiaryFixed: Color(4294959072),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294949307),
      onTertiaryFixedVariant: Color(4281598731),
      surfaceDim: Color(4279702038),
      surfaceBright: Color(4282267452),
      surfaceContainerLowest: Color(4279372817),
      surfaceContainerLow: Color(4280293918),
      surfaceContainer: Color(4280557090),
      surfaceContainerHigh: Color(4281280557),
      surfaceContainerHighest: Color(4282004279),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
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
