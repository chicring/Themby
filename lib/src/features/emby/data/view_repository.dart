

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/domain/view.dart';
import 'package:themby/src/helper/dio_provider.dart';

part 'view_repository.g.dart';

class ViewRepository{

  ViewRepository({required this.client, required this.site, required this.embyToken});

  final Dio client;

  final Site site;
  final String embyToken;


  Future<View> getViews() async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Views',
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      )
    );
    return View.fromJson(response.data);
  }

  Future<List<Media>> getLastMedia(String parentId) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/Latest',
        queryParameters: {
          'Limit': '16',
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio,ProductionYear,Status,EndDate,Overview',
          'ImageTypeLimit': '1',
          'EnableImageTypes': 'Primary,Backdrop,Thumb',
          'ParentId': parentId,
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      )
    );
    return List<Media>.from(response.data.map((e) => Media.fromJson(e)));
  }

  Future<List<Media>> getResumeMedia({String? parentId}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/Resume',
        queryParameters: {
          'Limit': '16',
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio,ProductionYear,Status,EndDate,Overview',
          'ImageTypeLimit': '1',
          'EnableImageTypes': 'Primary,Backdrop,Thumb',
          'MediaTypes': 'Video',
          'Recursive': 'true',
          'StartIndex': '0',
          'ParentId': parentId,
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      )
    );
    return List<Media>.from(response.data["Items"].map((e) => Media.fromJson(e)));
  }

  Future<List<Media>> getRecommendations() async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Suggestions',
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      )
    );
    return List<Media>.from(response.data["Items"].map((e) => Media.fromJson(e)));
  }

  Future<List<Media>> getSuggestions() async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items',
        queryParameters: {
          'Limit': '10',
          'ImageTypeLimit': '1',
          'ImageTypes': 'Backdrop',
          'EnableImageTypes': 'Logo,Backdrop',
          'Recursive': 'true',
          'IncludeItemTypes': 'Movie,Series',
          'SortBy': 'DateCreated,SortName,ProductionYear',
          'Fields': 'ProductionYear',
          'SortOrder': 'Descending',
          'EnableUserData': 'false',
          'EnableTotalRecordCount': 'false',
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      )
    );
    print(response.data);
    return List<Media>.from(response.data["Items"].map((e) => Media.fromJson(e)));
  }
}

@riverpod
ViewRepository viewRepository(ViewRepositoryRef ref) => ViewRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);


@riverpod
Future<View> getViews(GetViewsRef ref) => ref.read(viewRepositoryProvider).getViews();


@riverpod
Future<List<Media>> getLastMedia(GetLastMediaRef ref, String parentId) => ref.watch(viewRepositoryProvider).getLastMedia(parentId);

@riverpod
Future<List<Media>> getResumeMedia(GetResumeMediaRef ref, {String? parentId}) => ref.watch(viewRepositoryProvider).getResumeMedia(parentId: parentId);


@riverpod
Future<List<Media>> getRecommendations(GetRecommendationsRef ref) => ref.watch(viewRepositoryProvider).getRecommendations();


@riverpod
Future<List<Media>> getSuggestions(GetSuggestionsRef ref) => ref.watch(viewRepositoryProvider).getSuggestions();