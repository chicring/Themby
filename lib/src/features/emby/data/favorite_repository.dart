

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/user_data.dart';
import 'package:themby/src/helper/dio_provider.dart';

part 'favorite_repository.g.dart';

class FavoriteRepository{

  final Dio client;
  final Site site;
  final String embyToken;

  FavoriteRepository({
    required this.client,
    required this.site,
    required this.embyToken,
  });

  Future<UserData> toggleFavorite(String id, bool favorite) async {
    final response = await client.postUri(
        Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: favorite ? '/emby/Users/${site.userId}/FavoriteItems/$id'
              : '/emby/Users/${site.userId}/FavoriteItems/$id/Delete',
        ),
        options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
            'x-emby-token': site.accessToken,
          },
        ),
    );
    return UserData.fromJson(response.data);
  }

  Future<UserData> togglePlayed(String id, bool played) async{
    final response = await client.postUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: played ? '/emby/Users/${site.userId}/PlayedItems/$id'
            : '/emby/Users/${site.userId}/PlayedItems/$id/Delete',
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        },
      ),
    );
    return UserData.fromJson(response.data);
  }
}


@riverpod
FavoriteRepository favoriteRepository(FavoriteRepositoryRef ref)  => FavoriteRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);


@riverpod
Future<UserData> toggleFavorite(ToggleFavoriteRef ref, String id, bool favorite) async {
  return ref.read(favoriteRepositoryProvider).toggleFavorite(id, favorite);
}

@riverpod
Future<UserData> togglePlayed(TogglePlayedRef ref, String id, bool played) async {
  return ref.read(favoriteRepositoryProvider).togglePlayed(id, played);
}