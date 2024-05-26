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
}