import 'package:themby/common/global.dart';
import 'constant.dart';

class Helper{
  static Map<String, dynamic> buildHeaders({
    String? userId,
  }) {
    String authorizationValue = '${Constant.Emby_Client}=${Constant.Client},${Constant.Emby_Device}=$deviceName,${Constant.Emby_DeviceId}=$deviceId,${Constant.Emby_Client_Version}=1.0.0';
    if (userId != null && userId.isNotEmpty) {
      authorizationValue = '${Constant.Emby_UserId}=$userId,$authorizationValue';
    }
    return {
      Constant.X_Emby_Authorization: authorizationValue,
    };
  }


  static Map<String, dynamic> buildParams() {
    return {
      Constant.X_Emby_Client: Constant.Client,
      Constant.X_Emby_Device_Name: deviceName,
      Constant.X_Emby_Device_Id: deviceId,
      Constant.X_Emby_Client_Version: '1.0.0',
      Constant.X_Emby_Language: "zh-CN",
    };
  }
}