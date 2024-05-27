import 'package:dio/dio.dart';
import 'package:themby/common/global.dart';
import 'package:themby/common/models/emby_site.dart';

import 'helper.dart';


class LoginApi {

  static Future<EmbySite> login(EmbySite site) async {
      const String path = '/emby/Users/AuthenticateByName';

      Response<dynamic> response = await apiClient.post(
        '${site.host}:${site.port}',
        path,
        params: Helper.buildParams(),
        data: {
          'Username': site.username,
          'Pw': site.password,
        },
      );

      return site.copyWith(
        accessToken: response.data['AccessToken'],
        userId: response.data['User']['Id'],
        name: response.data['User']['Name'],
        imageTag: response.data['User']['PrimaryImageTag'],
      );
  }

}
