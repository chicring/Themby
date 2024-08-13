import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:themby/src/helper/device_info_provider.dart';

//横屏
Future<void> landScape() async {
  dynamic document;
  try {
    if (kIsWeb) {
      await document.documentElement?.requestFullscreen();
    } else if (Platform.isAndroid || Platform.isIOS) {
      await SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.immersiveSticky,
        overlays: [],
      );
      await SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
      );
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await const MethodChannel('com.alexmercerind/media_kit_video')
          .invokeMethod(
        'Utils.EnterNativeFullscreen',
      );
    }
  } catch (exception, stacktrace) {
    debugPrint(exception.toString());
    debugPrint(stacktrace.toString());
  }
}

//竖屏
Future<void> verticalScreen() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

// Future<void> enterFullScreen() async {
//   await SystemChrome.setEnabledSystemUIMode(
//     SystemUiMode.immersiveSticky,
//   );
// }

//退出全屏显示
Future<void> exitFullScreen() async {
  dynamic document;
  late SystemUiMode mode = SystemUiMode.edgeToEdge;
  try {
    if (kIsWeb) {
      document.exitFullscreen();
    } else if (Platform.isAndroid || Platform.isIOS) {
      if (Platform.isAndroid &&
          (await DeviceInfoPlugin().androidInfo).version.sdkInt < 29) {
        mode = SystemUiMode.manual;
      }
      await SystemChrome.setEnabledSystemUIMode(
        mode,
        overlays: SystemUiOverlay.values,
      );
      await SystemChrome.setPreferredOrientations([]);
    } else if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      await const MethodChannel('com.alexmercerind/media_kit_video')
          .invokeMethod(
        'Utils.ExitNativeFullscreen',
      );
    }
  } catch (exception, stacktrace) {
    debugPrint(exception.toString());
    debugPrint(stacktrace.toString());
  }
}


/// 设置横屏
Future setLandscapeOrientation() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

/// 设置竖屏
Future setPortraitOrientation() async {
  await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
}

/// 进入全屏
void enterFullScreen() {
  if (Platform.isAndroid || Platform.isIOS) {
    //全屏
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    setLandscapeOrientation();
  }
  // else {
  //   windowManager.setFullScreen(true);
  // }
}

/// 退出全屏
void exitFull() {
  if (Platform.isAndroid || Platform.isIOS) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
        overlays: SystemUiOverlay.values);
    setPortraitOrientation();
  }
  // else {
  //   windowManager.setFullScreen(false);
  // }
  // fullScreenState.value = false;

  //danmakuController?.clear();
}