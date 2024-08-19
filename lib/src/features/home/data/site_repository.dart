import 'dart:convert';  // 导入 JSON 编码库
import 'dart:typed_data';  // 导入 Uint8List 类型

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/objectbox.g.dart';
import 'package:themby/src/common/data/sync_setting.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/helper/dio_provider.dart';
import 'package:themby/src/helper/objectbox_provider.dart';
import 'package:webdav_client/webdav_client.dart' as webdav;

part 'site_repository.g.dart';

class SiteRepository{
  const SiteRepository({required this.client,required this.siteBox ,required this.embyToken, required this.webdavClient});

  final Dio client;

  final webdav.Client webdavClient;

  final String embyToken;

  final Box<Site> siteBox;

  Future<List<Site>> getSites() async {
    return siteBox.getAllAsync();
  }

  Future<List<Site>> finaAllByText(String text) async {
    Query<Site> query = siteBox.query(
          Site_.serverName.contains(text)
              .or(Site_.host.contains(text))
        ).build();
    return query.findAsync();
  }

  /*
  * Add Emby Site
   */
  Future<void> addEmbySite(Site site) async {
    final response = await client.postUri(
        Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/Users/AuthenticateByName',
        ),
        data: {
          'Username': site.username,
          'Pw': site.password,
        },
        options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
          }
        )
    );

    Site firstSite = site.copyWith(
      accessToken: response.data['AccessToken'],
      userId: response.data['User']['Id'],
      username: response.data['User']['Name'],
      imageTag: response.data['User']['PrimaryImageTag'],
    );

    final response2 = await  client.getUri(
        Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/System/Info/Public',
        ),
        options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
          }
        )
    );

    await siteBox.putAsync(firstSite.copyWith(
      serverName: response2.data['ServerName'],
      version: response2.data['Version'],
      date: DateTime.now(),
    ));
  }

  Future<void> removeEmbySite(Site site) async {
     siteBox.remove(site.id);
  }

  Future<void> updateEmbySite(Site site) async {

    final Site? oldSite = siteBox.get(site.id);

    if(oldSite != null && oldSite.password == site.password
        && oldSite.username == site.username
        && oldSite.scheme == site.scheme
        && oldSite.host == site.host
        && oldSite.port == site.port) {

      await siteBox.putAsync(site.copyWith(date: DateTime.now()), mode: PutMode.update);
      return;
    }
    
    final response = await client.postUri(
        Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/Users/AuthenticateByName',
        ),
        data: {
          'Username': site.username,
          'Pw': site.password,
        },
        options: Options(
            headers: {
              'X-Emby-Authorization': embyToken,
            }
        )
    );

    Site firstSite = site.copyWith(
      accessToken: response.data['AccessToken'],
      userId: response.data['User']['Id'],
      username: response.data['User']['Name'],
      imageTag: response.data['User']['PrimaryImageTag'],
    );

    final response2 = await  client.getUri(
        Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/System/Info/Public',
        ),
        options: Options(
            headers: {
              'X-Emby-Authorization': embyToken,
            }
        )
    );

    await siteBox.putAsync(firstSite.copyWith(
      serverName: response2.data['ServerName'],
      version: response2.data['Version'],
      date: DateTime.now(),
    ),mode: PutMode.update);
  }

  void _upsertSite(Site site) {
    final existingSite = siteBox.query(Site_.id.equals(site.id)).build().findFirst();
    if (existingSite != null) {
      siteBox.put(site,mode: PutMode.update);
    } else {
      siteBox.put(site);
    }
  }



  Future<bool> syncSite() async {
    try {
      // 读取远程目录内容
      final dirContent = await webdavClient.readDir("/");

      // 检查是否存在 "Themby" 目录, 如果不存在则创建
      if (!dirContent.any((element) => element.name == "Themby")) {
        await webdavClient.mkdir("Themby");
      }

      // 设置请求头
      webdavClient.setHeaders({
        'Content-Type': 'application/json',
      });

      // 获取本地 site 数据
      List<Site> localSites = siteBox.getAll();
      DateTime latestLocalDate = localSites.map((e) => e.date!).reduce((a, b) => a.isAfter(b) ? a : b);

      // 检查是否存在远程的 backup.json 文件
      webdav.File? remoteFile = dirContent.firstWhere((element) => element.name == "backup.json", orElse: () =>  webdav.File(name: ""));

      if (remoteFile.name=="backup.json") {
        // 获取远程文件的修改时间
        final remoteFileDate = remoteFile.mTime;

        if (latestLocalDate.isBefore(remoteFileDate!)) {
          // 如果远程数据较新，使用远程数据
          Uint8List remoteData = Uint8List.fromList(await webdavClient.read("Themby/backup.json"));
          String remoteJsonString = utf8.decode(remoteData);
          List<dynamic> remoteSitesList = jsonDecode(remoteJsonString);
          List<Site> remoteSites = remoteSitesList.map((e) => Site.fromJson(e)).toList();

          // 更新本地数据库：使用 upsertSite 方法
          for (var site in remoteSites) {
            _upsertSite(site); print(site.serverName); print("___________________________________________");
          }
        } else {
          // 如果本地数据较新或相等，则上传本地数据
          String jsonString = jsonEncode(localSites.map((e) => e.toJson()).toList());
          Uint8List data = Uint8List.fromList(utf8.encode(jsonString));
          await webdavClient.write("Themby/backup.json", data);
        }
      } else {
        // 如果远程没有文件，直接上传本地数据
        String jsonString = jsonEncode(localSites.map((e) => e.toJson()).toList());
        Uint8List data = Uint8List.fromList(utf8.encode(jsonString));
        await webdavClient.write("Themby/backup.json", data);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

}


@riverpod
SiteRepository siteRepository(SiteRepositoryRef ref) {
  final url = ref.watch(syncSettingProvider).syncWebdavUrl;
  final user = ref.watch(syncSettingProvider).syncWebdavUsername;
  final pwd = ref.watch(syncSettingProvider).syncWebdavPassword;

  webdav.Client webdavClient = webdav.newClient(
    url,
    user: user,
    password: pwd,
    debug: true,
  );

  return SiteRepository(
    client: ref.watch(dioProvider),
    webdavClient: webdavClient,
    siteBox: ref.watch(storeProvider).box<Site>(),
    embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
  );
}

@riverpod
Future<List<Site>> getSites(GetSitesRef ref) async {
  return ref.watch(siteRepositoryProvider).getSites();
}

@riverpod
Future<List<Site>> finaAllByText(FinaAllByTextRef ref,{required String text}) async {
  return ref.watch(siteRepositoryProvider).finaAllByText(text);
}

@riverpod
Future<void> addEmbySite(AddEmbySiteRef ref,{required Site site}) async {
  return ref.watch(siteRepositoryProvider).addEmbySite(site);
}

@riverpod
Future<void> removeEmbySite(RemoveEmbySiteRef ref,{required Site site}) async {
  return ref.watch(siteRepositoryProvider).removeEmbySite(site);
}

@riverpod
Future<void> updateEmbySite(UpdateEmbySiteRef ref,{required Site site}) async {
  return ref.watch(siteRepositoryProvider).updateEmbySite(site);
}

@riverpod
Future<bool> syncSite(SyncSiteRef ref) async {
  return ref.watch(siteRepositoryProvider).syncSite();
}