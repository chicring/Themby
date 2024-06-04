import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/domain/emby_site_state.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:themby/src/helper/device_info_provider.dart';
import 'package:uuid/uuid.dart';

part 'emby_state_service.g.dart';

@riverpod
class EmbyStateService extends _$EmbyStateService{
  static const String _key = 'deviceId';

  @override
  EmbySiteState build() {
    final SharedPreferences prefs = ref.watch(sharedPreferencesProvider);

    String deviceId = prefs.getString(_key) ?? const Uuid().v4();
    prefs.setString(_key, deviceId);

    String deviceName = ref.read(deviceNameProvider);

    return EmbySiteState.initial(_initToken(deviceName, deviceId));
  }

  void updateSite(Site site){
    state = state.copyWith(site: site);
  }

  void addUserIdToToken(String userId){
    state = state.copyWith(token: state.token + userId);
  }

  String _initToken(String deviceName, String deviceId){
    return 'Client=Themby,Device=$deviceName,DeviceId=$deviceId,Version=1.0.0,Emby UserId=';
  }

  Future<String> _getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return (await deviceInfo.androidInfo).model;
    } else if (Platform.isIOS) {
      return (await deviceInfo.iosInfo).name;
    } else if (Platform.isMacOS) {
      return (await deviceInfo.macOsInfo).model;
    } else if (Platform.isWindows) {
      return (await deviceInfo.windowsInfo).productName;
    } else if (Platform.isLinux) {
      return (await deviceInfo.linuxInfo).name;
    }
    return 'Unknown';
  }
}