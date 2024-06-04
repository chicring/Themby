import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/generated/l10n.dart';
import 'package:themby/src/helper/prefs_provider.dart';
import 'package:uuid/uuid.dart';

part 'device_info_provider.g.dart';

@riverpod
DeviceInfoPlugin deviceInfo(DeviceInfoRef ref){

  return DeviceInfoPlugin();
}


@riverpod
Future<String> deviceName(DeviceNameRef ref) async {
  final deviceInfo = ref.watch(deviceInfoProvider);
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return androidInfo.model;
  } else if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return iosInfo.name;
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
    return macInfo.model;
  } else if (Platform.isWindows) {
    WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
    return windowsInfo.productName;
  } else if (Platform.isLinux) {
    LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
    return linuxInfo.name;
  } else {
    return 'Unknown';
  }
}

@riverpod
String deviceId(DeviceIdRef ref){
  final SharedPreferences prefs = ref.watch(sharedPreferencesProvider);
  String? deviceId = prefs.getString('deviceId');
  if (deviceId == null) {
    Uuid uuid = const Uuid();
    deviceId = uuid.v4();
    prefs.setString('deviceId', deviceId);
  }
  return deviceId;
}

@riverpod
Map<String, String> deviceInfoParams(DeviceInfoParamsRef ref){
  final String deviceName = ref.watch(deviceNameProvider);
  final String deviceId = ref.watch(deviceIdProvider);
  return {
    'X-Emby-Client': "Themby",
    'X-Emby-Device-Name': deviceName,
    'X-Emby-Device-Id': deviceId,
    'X-Emby-Client-Version': '1.0.0',
  };
}

@riverpod
String deviceInfoHeader(DeviceInfoHeaderRef ref){
  final String deviceName = ref.watch(deviceNameProvider);
  final String deviceId = ref.watch(deviceIdProvider);
  return 'Client=Themby,Device=$deviceName,DeviceId=$deviceId,Version=1.0.0';
}