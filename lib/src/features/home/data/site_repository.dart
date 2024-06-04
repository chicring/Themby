import 'package:dio/dio.dart';
import 'package:themby/src/common/domiani/site.dart';

const EMBY_CLIENT_HEADERS = {
  "X-Emby-Client": 'Your Client Name',
  "X-Emby-Device-Name": '',
  "X-Emby-Device-Id": '',
  "X-Emby-Client-Version": 'Your Version Code',
};


class SiteRepository{
  const SiteRepository({required this.client, required this.headers});

  final Dio client;

  final Map<String, String> headers;

  Future<List<Site>> getSites() async {
    return [];
  }

  Future<Site> addEmbySite(Site site) async {
    final uri = Uri(
      scheme: site.scheme,
      host: site.host,
      port: site.port,
      queryParameters: {
        ...headers,
      },
    );

    return Site(
      scheme: site.scheme,
      host: site.host,
      port: site.port,
      username: site.username,
      password: site.password,
      accessToken: 'accessToken'
    );
  }

}