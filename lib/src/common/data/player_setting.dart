

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/src/helper/prefs_provider.dart';

import 'constant.dart';

part 'player_setting.g.dart';


class PlayerSetting{

  PlayerSetting({
    required this.prefs,
  });

  final SharedPreferences prefs;

  bool get doubleClickToPause => prefs.getBool(Constant.doubleClickToPauseKey) ?? true;
  set doubleClickToPause(bool value) => prefs.setBool(Constant.doubleClickToPauseKey, value);


  bool get doubleClickToJump => prefs.getBool(Constant.doubleClickToJumpKey) ?? true;
  set doubleClickToJump(bool value) => prefs.setBool(Constant.doubleClickToJumpKey, value);


  bool get longPressSpeed => prefs.getBool(Constant.longPressSpeedKey) ?? true;
  set longPressSpeed(bool value) => prefs.setBool(Constant.longPressSpeedKey, value);


  bool get mpvHardDecoding => prefs.getBool(Constant.mpvHardDecodingKey) ?? true;
  set mpvHardDecoding(bool value) => prefs.setBool(Constant.mpvHardDecodingKey, value);


  int get mpvBufferSize => prefs.getInt(Constant.mpvBufferSizeKey) ?? 64;
  set mpvBufferSize(int value) => prefs.setInt(Constant.mpvBufferSizeKey, value);


  int get fastForwardTime => prefs.getInt(Constant.fastForwardTimeKey) ?? 10;
  set fastForwardTime(int value) => prefs.setInt(Constant.fastForwardTimeKey, value);


  int get fastRewindTime => prefs.getInt(Constant.fastRewindTimeKey) ?? 10;
  set fastRewindTime(int value) => prefs.setInt(Constant.fastRewindTimeKey, value);

}

@riverpod
PlayerSetting playerSetting(PlayerSettingRef ref) => PlayerSetting(
  prefs: ref.watch(sharedPreferencesProvider),
);


