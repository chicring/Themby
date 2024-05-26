import 'package:themby/common/global.dart';
import 'package:themby/common/global.dart';

class PrefsHelper {

  //主题模式
  static int themeMode = prefs.getInt('themeMode') ?? 0;
  static Future<void> updateThemeMode(int value) async {
    await prefs.setInt('themeMode', value);
  }

  //动态颜色
  static bool dynamicColor = prefs.getBool('dynamicColor') ?? false;
  static Future<void> updateDynamicColor(bool value) async {
    await prefs.setBool('dynamicColor', value);
  }

  //主题颜色
  static int customColor = prefs.getInt('customColor') ?? 0;
  static Future<void> updateCustomColor(int value) async {
    await prefs.setInt('customColor', value);
  }

  //唯一设备ID
  static String deviceId() {
    String? deviceId = prefs.getString('deviceId');
    if (deviceId == null) {
      deviceId = uuid.v4();
      prefs.setString('deviceId', deviceId);
    }
    return deviceId;
  }
}
