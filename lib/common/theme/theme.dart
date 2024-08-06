//
// import 'package:flutter/material.dart';
//
// ThemeData buildLightTheme(ColorScheme? lightColorScheme){
//   return ThemeData(
//     // brightness: Brightness.light,
//     useMaterial3: true,
//     colorScheme: lightColorScheme,
//   );
// }
//
// ThemeData buildDarkTheme(ColorScheme? darkColorScheme) {
//   return ThemeData(
//     // brightness: Brightness.dark,
//     useMaterial3: true,
//     colorScheme: darkColorScheme
//   );
// }
//
//
// (ColorScheme light, ColorScheme dark) generateDynamicColourSchemes(ColorScheme lightDynamic, ColorScheme darkDynamic) {
//   var lightBase = ColorScheme.fromSeed(seedColor: lightDynamic.primary);
//   var darkBase = ColorScheme.fromSeed(seedColor: darkDynamic.primary, brightness: Brightness.dark);
//
//   var lightAdditionalColours = _extractAdditionalColours(lightBase);
//   var darkAdditionalColours = _extractAdditionalColours(darkBase);
//
//   var lightScheme = _insertAdditionalColours(lightBase, lightAdditionalColours);
//   var darkScheme = _insertAdditionalColours(darkBase, darkAdditionalColours);
//
//   return (lightScheme.harmonized(), darkScheme.harmonized());
// }
//
// List<Color> _extractAdditionalColours(ColorScheme scheme) => [
//   scheme.surface,
//   scheme.surfaceDim,
//   scheme.surfaceBright,
//   scheme.surfaceContainerLowest,
//   scheme.surfaceContainerLow,
//   scheme.surfaceContainer,
//   scheme.surfaceContainerHigh,
//   scheme.surfaceContainerHighest,
// ];
//
// ColorScheme _insertAdditionalColours(ColorScheme scheme, List<Color> additionalColours) => scheme.copyWith(
//   surface: additionalColours[0],
//   surfaceDim: additionalColours[1],
//   surfaceBright: additionalColours[2],
//   surfaceContainerLowest: additionalColours[3],
//   surfaceContainerLow: additionalColours[4],
//   surfaceContainer: additionalColours[5],
//   surfaceContainerHigh: additionalColours[6],
//   surfaceContainerHighest: additionalColours[7],
// );