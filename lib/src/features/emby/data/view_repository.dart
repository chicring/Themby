

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/common/riverpod_cache/future_provider.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/request_key_repository.dart';
import 'package:themby/src/features/emby/domain/emby/custom/images_custom.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/emby_response.dart';
import 'package:themby/src/helper/cancel_token_ref.dart';
import 'package:themby/src/helper/dio_provider.dart';
import 'package:themby/src/helper/objectbox_provider.dart';



part 'view_repository.g.dart';

typedef ItemQuery = ({
  String parentId,
  String genreIds,
  int page,
  String includeItemTypes,
  String sortBy,
  String sortOrder,
  String filters
});

class ViewRepository{

  ViewRepository({required this.client, required this.site, required this.embyToken});

  final Dio client;

  final Site site;
  final String embyToken;


  Future<EmbyResponse> getViews({CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Views',
        queryParameters: {
          "MediaTypes": "Video",
          "Fields": "BasicSyncInfo,CanDelete,PrimaryImageAspectRatio,ProductionYear"
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
    /// 过滤掉非电影的视图
    // Process the response data
    final resp = EmbyResponse.fromJson(response.data);

    resp.items = resp.items.map((item) {
      item.imagesCustom = ImagesCustom.builder(item, site);
      return item;
    }).toList();

    return EmbyResponse(
      items: resp.items.where((element) {
        return element.collectionType == 'movies' || element.collectionType == 'tvshows' || element.collectionType == null;
      }).toList(),
      totalRecordCount: resp.totalRecordCount,
    );
  }

  Future<Item> getMedia(String id, {CancelToken? cancelToken }) async{
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
    final item = Item.fromJson(response.data);
    item.imagesCustom = ImagesCustom.builder(item, site);
    return item;
  }


  Future<List<Item>> getLastMedia(String parentId, {CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/Latest',
        queryParameters: {
          'Limit': '16',
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio,ProductionYear,Status,EndDate,CriticRating,OfficialRating,CommunityRating',
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
    final list = List<Item>.from(
      response.data.map((e) {
        final item = Item.fromJson(e);
        item.imagesCustom = ImagesCustom.builder(item, site);
        return item;
      }),
    );
    return list;

  }

  Future<List<Item>> getResumeMedia({String? parentId, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items/Resume',
        queryParameters: {
          'Limit': '25',
          'Fields': 'BasicSyncInfo,CanDelete,Container,PrimaryImageAspectRatio,ProductionYear,EndDate,CriticRating,OfficialRating,CommunityRating,Status',
          'ImageTypeLimit': '1',
          'EnableImageTypes': 'Primary,Backdrop,Thumb',
          'MediaTypes': 'Video',
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
    final list = List<Item>.from(
      response.data["Items"].map((e) {
        final item = Item.fromJson(e);
        item.imagesCustom = ImagesCustom.builder(item, site);
        return item;
      }),
    );
    return list;
  }

  Future<List<Item>> getRecommendations({CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Recommendations',
        queryParameters: {
          "Fields": "BasicSyncInfo,CanDelete,PrimaryImageAspectRatio,ProductionYear",
          "EnableImageTypes": "Primary,Backdrop,Thumb",
          "categoryLimit": "1",
          "ItemLimit": "8"
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
    final list = List<Item>.from(
      response.data["Items"].map((e) {
        final item = Item.fromJson(e);
        item.imagesCustom = ImagesCustom.builder(item, site);
        return item;
      }),
    );
    return list;
  }

  Future<List<Item>> getSuggestions({CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Users/${site.userId}/Items',
        queryParameters: {
          'Limit': '6',
          'ImageTypeLimit': '1',
          'ImageTypes': 'Backdrop',
          'EnableImageTypes': 'Logo,Backdrop,Primary',
          'Recursive': 'true',
          'IncludeItemTypes': 'Movie,Series',
          'SortBy': 'IsFavoriteOrLiked,Random',
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
    final list = List<Item>.from(
      response.data["Items"].map((e) {
        final item = Item.fromJson(e);
        item.imagesCustom = ImagesCustom.builder(item, site);
        return item;
      }),
    );
    return list;
  }

  Future<List<Item>> getSeasons(String seriesId, {CancelToken? cancelToken}) async {
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
    final list = List<Item>.from(
      response.data['Items'].map((e) {
        final item = Item.fromJson(e);
        item.imagesCustom = ImagesCustom.builder(item, site);
        return item;
      }),
    );
    return list;
  }

  Future<List<Item>> getEpisodes(String sid, String vid, {CancelToken? cancelToken}) async {
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
    final list = List<Item>.from(
      response.data['Items'].map((e) {
        final item = Item.fromJson(e);
        item.imagesCustom = ImagesCustom.builder(item, site);
        return item;
      }),
    );
    return list;
  }

  Future<EmbyResponse> getItem({required ItemQuery itemQuery, CancelToken? cancelToken}) async {
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
          'GenreIds': itemQuery.genreIds,
          'SortBy': itemQuery.sortBy,
          'Fields': 'BasicSyncInfo,CanDelete,CanDownload,Container,PrimaryImageAspectRatio,ProductionYear,CommunityRating,OfficialRating,Status,CriticRating,EndDate,Path',
          'SortOrder': itemQuery.sortOrder,
          'EnableUserData': 'true',
          'Filters': itemQuery.filters,
        }
      ),
      options: Options(
        headers: {
          'X-Emby-Authorization': embyToken,
          'x-emby-token': site.accessToken,
        },
        extra: {
          "bypassCache": itemQuery.filters.isEmpty ? false : true,
        }
      ),
      cancelToken: cancelToken,
    );
    final resp = EmbyResponse.fromJson(response.data);
    resp.items = resp.items.map((item) {
      item.imagesCustom = ImagesCustom.builder(item, site);
      return item;
    }).toList();

    return resp;
  }

  Future<EmbyResponse> getSimilar({required String id, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Items/$id/Similar',
        queryParameters: {
          'Fields': 'BasicSyncInfo,CanDelete,PrimaryImageAspectRatio,ProductionYear,Status,EndDate,CommunityRating',
          'ImageTypeLimit': '1',
          'UserId': site.userId,
          'Limit': '12',
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
    final resp = EmbyResponse.fromJson(response.data);
    resp.items = resp.items.map((item) {
      item.imagesCustom = ImagesCustom.builder(item, site);
      return item;
    }).toList();

    return resp;
  }


  Future<List<Item>> getNextUp({required String seriesId, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
        scheme: site.scheme,
        host: site.host,
        port: site.port,
        path: '/emby/Shows/NextUp',
        queryParameters: {
          'Fields': 'BasicSyncInfo,CanDelete,CanDownload,Container,PrimaryImageAspectRatio,ProductionYear,CommunityRating,OfficialRating',
          "EnableUserData": "true",
          "Limit": "20",
          "EnableTotalRecordCount": "false",
          "SeriesId": seriesId,
        },
      ),
      options: Options(
          headers: {
            'X-Emby-Authorization': embyToken,
            'x-emby-token': site.accessToken,
          }
      ),
      cancelToken: cancelToken,
    );

    final resp = EmbyResponse.fromJson(response.data);
    resp.items = resp.items.map((item) {
      item.imagesCustom = ImagesCustom.builder(item, site);
      return item;
    }).toList();

    return resp.items;
  }


  Future<EmbyResponse> getGenres({required String id, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/Genres',
          queryParameters: {
            'EnableImageTypes': 'Primary,Backdrop,Thumb',
            'Fields': 'BasicSyncInfo,CanDelete,PrimaryImageAspectRatio',
            'ImageTypeLimit': '1',
            'UserId': site.userId,
            'Limit': '50',
            'Recursive': 'true',
            'StartIndex': '0',
            'SortBy': 'SortName',
            'SortOrder': 'Ascending',
            'ParentId': id
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
    final resp = EmbyResponse.fromJson(response.data);
    resp.items = resp.items.map((item) {
      item.imagesCustom = ImagesCustom.builder(item, site);
      return item;
    }).toList();

    return resp;
  }

  Future<void> hideFromResume() async {

  }
}

@riverpod
ViewRepository viewRepository(ViewRepositoryRef ref) => ViewRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);


@riverpod
Future<EmbyResponse> getViews(GetViewsRef ref){

  final viewRepo = ref.watch(viewRepositoryProvider);

  final cancelToken = ref.cancelToken();

  final views = viewRepo.getViews(cancelToken: cancelToken);

  return ref.futureSWR(
    key: ref.read(viewKeyProvider),
    future: () => views,
    refresh: () => (),
    store: ref.read(storeProvider),
    fromJson: EmbyResponse.fromJson,
    toJson: (object) => object.toJson(),
  );
}

@riverpod
Future<Item> getMedia(GetMediaRef ref, String id){

  final viewRepo = ref.read(viewRepositoryProvider);

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

  ref.onRemoveListener((){

  });

  return viewRepo.getMedia(id, cancelToken: cancelToken);
}


@riverpod
Future<List<Item>> getLastMedia(GetLastMediaRef ref, String parentId){
  final cancelToken = ref.cancelToken();

  return ref.futureListSWR(
    key: ref.read(lastMediaKeyProvider(parentId)),
    future: () => ref.watch(viewRepositoryProvider).getLastMedia(parentId, cancelToken: cancelToken),
    refresh: () => (),
    store: ref.read(storeProvider),
    fromJson: Item.fromJson,
    toJson: (object) => object.toJson(),
  );
  // return ref.watch(viewRepositoryProvider).getLastMedia(parentId,cancelToken: cancelToken);
}

@riverpod
Future<List<Item>> getResumeMedia(GetResumeMediaRef ref, {String? parentId }) {
  final cancelToken = ref.cancelToken();
  return ref.futureListSWR(
    key: ref.read(resumeKeyProvider(parentId: parentId)),
    future: () => ref.watch(viewRepositoryProvider).getResumeMedia(parentId: parentId, cancelToken: cancelToken),
    refresh: () => (),
    store: ref.read(storeProvider),
    fromJson: Item.fromJson,
    toJson: (object) => object.toJson(),
  );
  // return ref.watch(viewRepositoryProvider).getResumeMedia(parentId: parentId, cancelToken: cancelToken);
}

@riverpod
Future<List<Item>> getRecommendations(GetRecommendationsRef ref) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getRecommendations(cancelToken: cancelToken);
}

@riverpod
Future<List<Item>> getSuggestions(GetSuggestionsRef ref) {
  final cancelToken = ref.cancelToken();
  return ref.futureListSWR(
    key: ref.read(suggestionKeyProvider),
    future: () => ref.read(viewRepositoryProvider).getSuggestions(cancelToken: cancelToken),
    refresh: () => (),
    store: ref.read(storeProvider),
    fromJson: Item.fromJson,
    toJson: (object) => object.toJson(),
  );

  // return ref.read(viewRepositoryProvider).getSuggestions(cancelToken: cancelToken);
}

@riverpod
Future<List<Item>> getSeasons(GetSeasonsRef ref, String seriesId) {
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
  return ref.read(viewRepositoryProvider).getSeasons(seriesId, cancelToken: cancelToken);
}

@riverpod
Future<List<Item>> getEpisodes(GetEpisodesRef ref, String sid, String vid) {
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
  return ref.read(viewRepositoryProvider).getEpisodes(sid, vid, cancelToken: cancelToken);
}

@riverpod
Future<EmbyResponse> getItem(GetItemRef ref,{required ItemQuery itemQuery}) {
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


@riverpod
Future<EmbyResponse> getSimilar(GetSimilarRef ref, String id) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getSimilar(id: id, cancelToken: cancelToken);
}

@riverpod
Future<List<Item>> getNextUp(GetNextUpRef ref, String seriesId) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getNextUp(seriesId: seriesId, cancelToken: cancelToken);
}

@riverpod
Future<EmbyResponse> getGenres(GetGenresRef ref, String id) {
  final cancelToken = ref.cancelToken();
  return ref.read(viewRepositoryProvider).getGenres(id: id, cancelToken: cancelToken);
}