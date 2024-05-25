import 'package:themby/common/helper/Prefs_helper.dart';

class AppearanceState{
  final int themeMode;
  final bool dynamicColor;
  final int customColor;

  AppearanceState({
    required this.themeMode,
    required this.dynamicColor,
    required this.customColor,
  });

  AppearanceState.initial()
    : themeMode = PrefsHelper.themeMode,
      dynamicColor = PrefsHelper.dynamicColor,
      customColor = PrefsHelper.customColor;

  AppearanceState copyWith({
    int? themeMode,
    bool? dynamicColor,
    int? customColor,
  }) {
    return AppearanceState(
      themeMode: themeMode ?? this.themeMode,
      dynamicColor: dynamicColor ?? this.dynamicColor,
      customColor: customColor ?? this.customColor,
    );
  }
}