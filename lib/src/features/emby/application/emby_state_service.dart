
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/src/common/domiani/device_info.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/domain/emby_site_state.dart';
import 'package:themby/src/helper/package_info.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:themby/src/helper/device_info_provider.dart';
import 'package:uuid/uuid.dart';

part 'emby_state_service.g.dart';

@riverpod
class EmbyStateService extends _$EmbyStateService{
  static const String _key = 'deviceId';

  @override
  EmbySiteState build() {

    DeviceInfo deviceInfo = ref.watch(deviceInfoProvider);

    final String deviceName = deviceInfo.deviceName;

    final String deviceId = deviceInfo.deviceId;

    print(deviceName);
    return EmbySiteState.initial(_initToken(deviceName, _getDeviceId(deviceId)));
  }

  void updateSite(Site site){
    state = state.copyWith(site: site);
  }

  void addUserIdToToken(String userId){
    state = state.copyWith(token: state.token.replaceFirst('null', userId));
  }

  String _initToken(String deviceName, String deviceId){
    return 'Emby UserId=null,Client=Themby,Device=$deviceName,DeviceId=$deviceId,Version=${ref.read(packageInfoProvider).version}';
  }

  String _getDeviceId(String realDeviceId){

    if(realDeviceId == "unknown"){
      final SharedPreferences prefs = ref.watch(sharedPreferencesProvider);
      String deviceId = prefs.getString(_key) ?? const Uuid().v4();
      realDeviceId = deviceId;
      prefs.setString(_key, deviceId);
    }

    return realDeviceId;
  }
}