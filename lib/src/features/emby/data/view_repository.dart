

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/emby_response.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/emby/domain/query/item_options.dart';
import 'package:themby/src/features/emby/domain/season.dart';
import 'package:themby/src/features/emby/domain/view.dart';
import 'package:themby/src/helper/cancel_token_ref.dart';
import 'package:themby/src/helper/dio_provider.dart';

part 'view_repository.g.dart';

typedef ItemQuery = ({
  String parentId,
  int page,
  String includeItemTypes,
  String sortBy,
  String sortOrder,
});

class ViewRepository{

  ViewRepository({required this.client, required this.site, required this.embyToken});

  final Dio client;

  final Site site;
  final String embyToken;


  Future<View> getViews({CancelToken? cancelToken}) async {
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
      ),
      cancelToken: cancelToken,
    );
    return View.fromJson(response.data);
  }

  Future<MediaDetail> getMedia(String id, {CancelToken? cancelToken }) async{
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/$id',
      ),
      options: Options(
        headers: {
        'X-Emby-Authorization': embyToken,
        'x-emby-token': site.accessToken,
        }
      ),
      cancelToken: cancelToken,
    );

    return MediaDetail.fromJson(response.data);
  }


  Future<List<Media>> getLastMedia(String parentId, {CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/Latest',
        queryParameters: {
          'Limit': '16',
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio,ProductionYear,Status,EndDate,Overview,CriticRating,OfficialRating,CommunityRating',
          'ImageTypeLimit': '1',
          'EnableImageTypes': 'Primary,Backdrop,Thumb',
          'EnableUserData': 'true',
          'ParentId': parentId,
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      ),
      cancelToken: cancelToken,
    );
    return List<Media>.from(response.data.map((e) => Media.fromJson(e)));
  }

  Future<List<Media>> getResumeMedia({String? parentId, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/Resume',
        queryParameters: {
          'Limit': '16',
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio,ProductionYear,EndDate,CriticRating,OfficialRating,CommunityRating,Status',
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
      ),
      cancelToken: cancelToken,
    );
    return List<Media>.from(response.data["Items"].map((e) => Media.fromJson(e)));
  }

  Future<List<Media>> getRecommendations({CancelToken? cancelToken}) async {
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
      ),
      cancelToken: cancelToken,
    );
    return List<Media>.from(response.data["Items"].map((e) => Media.fromJson(e)));
  }

  Future<List<Media>> getSuggestions({CancelToken? cancelToken}) async {
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
          'EnableImageTypes': 'Logo,Backdrop,Primary',
          'Recursive': 'true',
          'IncludeItemTypes': 'Movie,Series',
          'SortBy': 'DateCreated,SortName,ProductionYear,Overview',
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
      ),
      cancelToken: cancelToken,
    );

    return List<Media>.from(response.data["Items"].map((e) => Media.fromJson(e)));
  }

  Future<List<Season>> getSeasons(String seriesId, {CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Shows/$seriesId/Seasons',
        queryParameters: {
          'UserId': site.userId,
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio',
          'EnableTotalRecordCount': 'false',
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      ),
      cancelToken: cancelToken,
    );
    return EmbyResponse<Season>.fromJson(response.data, (json) => Season.fromJson(json)).items;
  }

  Future<List<Episode>> getEpisodes(String sid, String vid, {CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Shows/$vid/Episodes',
        queryParameters: {
          'UserId': site.userId,
          'SeasonId': sid,
          'Fields': 'Overview,PrimaryImageAspectRatio',
          'EnableTotalRecordCount': 'false',
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      ),
      cancelToken: cancelToken,
    );
    return EmbyResponse<Episode>.fromJson(response.data, (json) => Episode.fromJson(json)).items;
  }

  Future<EmbyResponse<Media>> getItem({required ItemQuery itemQuery, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items',
        queryParameters: {
          'Limit': '30',
          'ImageTypeLimit': '1',
          'EnableImageTypes': 'Logo,Backdrop,Primary,Thumb,Banner',
          'Recursive': 'true',
          'IncludeItemTypes': itemQuery.includeItemTypes,
          'StartIndex': (itemQuery.page * 30 ) .toString(),
          'ParentId': itemQuery.parentId,
          'SortBy': itemQuery.sortBy,
          'Fields': 'BasicSyncInfo,CanDelete,CanDownload,Container,PrimaryImageAspectRatio,ProductionYear,CommunityRating,OfficialRating,Status,CriticRating,EndDate,Path',
          'SortOrder': itemQuery.sortOrder,
          'EnableUserData': 'true',
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        }
      ),
      cancelToken: cancelToken,
    );
    return EmbyResponse<Media>.fromJson(response.data, (json) => Media.fromJson(json));
  }

}

@riverpod
ViewRepository viewRepository(ViewRepositoryRef ref) => ViewRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);


@riverpod
Future<View> getViews(GetViewsRef ref){

  final viewRepo = ref.watch(viewRepositoryProvider);

  final cancelToken = ref.cancelToken();

  final link = ref.keepAlive();

  ref.onDispose(() {
    cancelToken.cancel();
  });

  ref.onCancel(() {
    link.close();
  });

  return viewRepo.getViews(cancelToken: cancelToken);
}

@riverpod
Future<MediaDetail> getMedia(GetMediaRef ref, String id){
  final viewRepo = ref.read(viewRepositoryProvider);

  final cancelToken = ref.cancelToken();

  return viewRepo.getMedia(id, cancelToken: cancelToken);
}


@riverpod
Future<List<Media>> getLastMedia(GetLastMediaRef ref, String parentId ){
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getLastMedia(parentId,cancelToken: cancelToken);
}

@riverpod
Future<List<Media>> getResumeMedia(GetResumeMediaRef ref, {String? parentId }) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getResumeMedia(parentId: parentId, cancelToken: cancelToken);
}

@riverpod
Future<List<Media>> getRecommendations(GetRecommendationsRef ref) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getRecommendations(cancelToken: cancelToken);
}

@riverpod
Future<List<Media>> getSuggestions(GetSuggestionsRef ref) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getSuggestions(cancelToken: cancelToken);
}

@riverpod
Future<List<Season>> getSeasons(GetSeasonsRef ref, String seriesId) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getSeasons(seriesId, cancelToken: cancelToken);
}

@riverpod
Future<List<Episode>> getEpisodes(GetEpisodesRef ref, String sid, String vid) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getEpisodes(sid, vid, cancelToken: cancelToken);
}

@riverpod
Future<EmbyResponse<Media>> getItem(GetItemRef ref,{required ItemQuery itemQuery}) {
  final viewRepo = ref.watch(viewRepositoryProvider);

  final cancelToken = ref.cancelToken();

  final link = ref.keepAlive();

  Timer? timer;

  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });

  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });

  ref.onResume(() {
    timer?.cancel();
  });
  return viewRepo.getItem(itemQuery: itemQuery, cancelToken: cancelToken);
}