import 'package:flutter/material.dart';

ThemeData buildLightTheme(ColorScheme? lightColorScheme){
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: lightColorScheme,
  );
}

ThemeData buildDarkTheme(ColorScheme? darkColorScheme) {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: darkColorScheme
  );
}