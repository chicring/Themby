import 'package:dio/dio.dart';
import 'package:objectbox/objectbox.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/objectbox.g.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/helper/dio_provider.dart';
import 'package:themby/src/helper/objectbox_provider.dart';

part 'site_repository.g.dart';

class SiteRepository{
  const SiteRepository({required this.client,required this.siteBox ,required this.embyToken});

  final Dio client;

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
    ));
  }

  Future<void> removeEmbySite(Site site) async {
    siteBox.removeAsync(site.id);
  }
}


@riverpod
SiteRepository siteRepository(SiteRepositoryRef ref) => SiteRepository(
  client: ref.watch(dioProvider),
  siteBox: ref.watch(storeProvider).box<Site>(),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);

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