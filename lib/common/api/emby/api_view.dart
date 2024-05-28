

import 'package:dio/dio.dart';
import 'package:themby/common/models/emby_site.dart';

import '../../global.dart';
import '../../models/emby_view.dart';
import 'helper.dart';

class ViewApi{

  static Future<List<EmbyView>> getView(EmbySite site) async {
    String path = '/emby/Users/${site.userId}/Views';

    Response<dynamic> response = await apiClient.get(
      '${site.host}:${site.port}',
      path,
      params: {
        "IncludeExternalContent=false": "false",
      },
      headers: Helper.buildHeaders(
        userId: site.userId,
        token: site.accessToken,
      ),
    );

    print(List<EmbyView>.from(response.data["Items"].map((x) => EmbyView.fromJson(x))).first.name);
    return List<EmbyView>.from(response.data["Items"].map((x) => EmbyView.fromJson(x)));
  }

}