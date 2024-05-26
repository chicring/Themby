import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:themby/common/global.dart';
import 'package:themby/common/helper/dio_helper.dart';
import 'package:uuid/uuid.dart';
import '../router/router.dart';
import 'package:device_info_plus/device_info_plus.dart';

import 'helper/prefs_helper.dart';

Future<void> intiApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  if (Platform.isAndroid){
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent
    ));
  }

  /*
    路由初始化
  */
  CustomNavigationHelper.instance;

  /*
    持久化初始化
  */
  prefs = await SharedPreferences.getInstance();

  /*
    实例化dio
  */
  apiClient = DioHelper();

  uuid = const Uuid();

  /*
    设备信息初始化
  */

  Future<void> initDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceName = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceName = iosInfo.name;
    } else if (Platform.isMacOS) {
      MacOsDeviceInfo macInfo = await deviceInfo.macOsInfo;
      deviceName = macInfo.model;
    } else if (Platform.isWindows) {
      WindowsDeviceInfo windowsInfo = await deviceInfo.windowsInfo;
      deviceName = windowsInfo.productName;
    } else if (Platform.isLinux) {
      LinuxDeviceInfo linuxInfo = await deviceInfo.linuxInfo;
      deviceName = linuxInfo.name;
    } else {
      deviceName = 'Unknown';
    }

    deviceId = PrefsHelper.deviceId();
  }

  initDeviceInfo();

}