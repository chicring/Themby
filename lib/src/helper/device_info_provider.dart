import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/device_info.dart';

part 'device_info_provider.g.dart';

@riverpod
DeviceInfo deviceInfo(DeviceInfoRef ref){
  return throw UnimplementedError();
}

Future<DeviceInfo> initDevice() async {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceName = 'unknown';
  String deviceId = 'unknown';
  if (Platform.isAndroid) {
    var androidInfo = await deviceInfo.androidInfo;
    deviceName = '${androidInfo.manufacturer}-${androidInfo.model}';
    deviceId = androidInfo.serialNumber;
  } else if (Platform.isIOS) {
    deviceName = (await deviceInfo.iosInfo).name;
    deviceId = (await deviceInfo.iosInfo).model;
  } else if (Platform.isMacOS) {
    deviceName = (await deviceInfo.macOsInfo).model;
    deviceId = (await deviceInfo.macOsInfo).model;
  } else if (Platform.isWindows) {
    deviceName = (await deviceInfo.windowsInfo).productName;
    deviceId = (await deviceInfo.windowsInfo).computerName;
  } else if (Platform.isLinux) {
    deviceName = (await deviceInfo.linuxInfo).name;
    deviceId = (await deviceInfo.linuxInfo).id;
  }
  return DeviceInfo(deviceName: deviceName, deviceId: deviceId);
}