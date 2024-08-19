
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/src/common/data/constant.dart';
import 'package:themby/src/helper/prefs_provider.dart';

part 'sync_setting.g.dart';

class SyncSetting{

  SyncSetting({
    required this.prefs,
  });

  final SharedPreferences prefs;

  bool get enableSync => prefs.getBool(Constant.syncWebdavEnableKey) ?? true;
  set enableSync(bool value) => prefs.setBool(Constant.syncWebdavEnableKey, value);

  bool get autoSync => prefs.getBool(Constant.syncAutoKey) ?? true;
  set autoSync(bool value) => prefs.setBool(Constant.syncAutoKey, value);

  String get syncWebdavUrl => prefs.getString(Constant.syncWebdavHostKey) ?? '';
  set syncWebdavUrl(String value) => prefs.setString(Constant.syncWebdavHostKey, value);

  String get syncWebdavUsername => prefs.getString(Constant.syncWebdavUsernameKey) ?? '';
  set syncWebdavUsername(String value) => prefs.setString(Constant.syncWebdavUsernameKey, value);

  String get syncWebdavPassword => prefs.getString(Constant.syncWebdavPasswordKey) ?? '';
  set syncWebdavPassword(String value) => prefs.setString(Constant.syncWebdavPasswordKey, value);

  void setSyncWebdav(String url, String username, String password){
    prefs.setString(Constant.syncWebdavHostKey, url);
    prefs.setString(Constant.syncWebdavUsernameKey, username);
    prefs.setString(Constant.syncWebdavPasswordKey, password);
  }
}

@riverpod
SyncSetting syncSetting(SyncSettingRef ref) => SyncSetting(
  prefs: ref.watch(sharedPreferencesProvider),
);