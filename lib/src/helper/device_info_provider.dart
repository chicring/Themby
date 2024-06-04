import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_provider.g.dart';

@riverpod
DeviceInfoPlugin deviceInfo(DeviceInfoRef ref){
  return DeviceInfoPlugin();
}

@Riverpod(keepAlive: true)
class DeviceName extends _$DeviceName{

  @override
  String build(){
    return 'null';
  }

  /*
  * 初始化设备名称，避免异步获取设备名称时出现空值
   */
  Future<void> initDeviceName() async {
    DeviceInfoPlugin deviceInfo = ref.read(deviceInfoProvider);
    String deviceName = 'Unknown';

    if (Platform.isAndroid) {
      deviceName = (await deviceInfo.androidInfo).model;
    } else if (Platform.isIOS) {
      deviceName = (await deviceInfo.iosInfo).name;
    } else if (Platform.isMacOS) {
      deviceName = (await deviceInfo.macOsInfo).model;
    } else if (Platform.isWindows) {
      deviceName = (await deviceInfo.windowsInfo).productName;
    } else if (Platform.isLinux) {
      deviceName = (await deviceInfo.linuxInfo).name;
    }
    state = deviceName;
  }
}
