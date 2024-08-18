import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'constant.dart';

part 'subtitle_setting.g.dart';

class SubtitleSetting {
  SubtitleSetting({
    required this.prefs,
  });

  final SharedPreferences prefs;

  int get subtitleSize => prefs.getInt(Constant.subtitleSizeKey) ?? 16;
  set subtitleSize(int value) => prefs.setInt(Constant.subtitleSizeKey, value);

  int get subtitleColor => prefs.getInt(Constant.subtitleColorKey) ?? 0xFFFFFFFF;
  set subtitleColor(int value) => prefs.setInt(Constant.subtitleColorKey, value);

  bool get subtitleBold => prefs.getBool(Constant.subtitleBoldKey) ?? false;
  set subtitleBold(bool value) => prefs.setBool(Constant.subtitleBoldKey, value);

  int get subtitleBackgroundColor => prefs.getInt(Constant.subtitleBackgroundColorKey) ?? 0x00000000;
  set subtitleBackgroundColor(int value) => prefs.setInt(Constant.subtitleBackgroundColorKey, value);

  bool get subtitleShadow => prefs.getBool(Constant.subtitleShadowKey) ?? false;
  set subtitleShadow(bool value) => prefs.setBool(Constant.subtitleShadowKey, value);

  TextStyle get subtitleStyle => TextStyle(
    height: 1.5,
    fontSize: subtitleSize.toDouble(),
    letterSpacing: 0.0,
    wordSpacing: 0.0,
    color: Color(subtitleColor),
    fontWeight: subtitleBold ? FontWeight.bold : FontWeight.normal,
    backgroundColor: Colors.transparent,
    // shadows: subtitleShadow ? [
    //   Shadow(
    //     color: Color(0x80000000),
    //     offset: Offset(1, 1),
    //     blurRadius: 3,
    //   ),
    // ] : null,
  );
}

@riverpod
SubtitleSetting subtitleSetting(SubtitleSettingRef ref) => SubtitleSetting(
  prefs: ref.watch(sharedPreferencesProvider),
);
