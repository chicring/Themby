import 'package:dio/dio.dart';
import 'package:themby/common/global.dart';

import '../../models/emby_config.dart';
import 'helper.dart';


class LoginApi {

  static Future<Response> login(String username, String password, EmbyConfig config) async {
      const String path = '/emby/Users/AuthenticateByName';

      return apiClient.post(
          '${config.host}:${config.port}',
          path,
          headers: Helper.buildHeaders(),
          data: {
            'Username': username,
            'Pw': password,
          },
      );
  }

}
