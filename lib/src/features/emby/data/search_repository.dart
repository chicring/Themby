

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/domain/emby_response.dart';
import 'package:themby/src/features/emby/domain/media.dart';


import 'package:themby/src/helper/cancel_token_ref.dart';
import 'package:themby/src/helper/dio_provider.dart';

part 'search_repository.g.dart';

class SearchRepository{

  final Dio client;
  final Site site;
  final String embyToken;

  List<Site>? sites;

  SearchRepository({
    required this.client,
    required this.site,
    required this.embyToken,
  });


  Future<EmbyResponse<Media>> getSearchRecommend({CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/Users/${site.userId}/Items',
          queryParameters: {
            'Limit': '20',
            'ImageTypeLimit': '0',
            "IncludeItemTypes": "Movie,Series",
            "SortBy": "IsFavoriteOrLiked,Random",
            'Recursive': 'true',
            'EnableUserData': 'true',
            'EnableImage': 'false',
          }
      ),
      options: Options(
          headers: {
            'X-Emby-Authorization': site.accessToken,
            'x-emby-token': site.accessToken,
          }
      ),
      cancelToken: cancelToken,
    );
    return EmbyResponse<Media>.fromJson(response.data, (json) => Media.fromJson(json));
  }

  Future<EmbyResponse<Media>> search({String? query, CancelToken? cancelToken}) async {
    final response = await client.getUri(
      Uri(
          scheme: site.scheme,
          host: site.host,
          port: site.port,
          path: '/emby/Users/${site.userId}/Items',
          queryParameters: {
            'Limit': '50',
            "StartIndex": "0",
            'ImageTypeLimit': '1',
            "IncludeItemTypes": "Movie,Series",
            "SortBy": "SortName",
            "SortOrder": "Ascending",
            "SearchTerm": "${query!}%",
            'Recursive': 'true',
            "Fields": "BasicSyncInfo,CanDelete,PrimaryImageAspectRatio,ProductionYear,Status,EndDate,CommunityRating",
            "EnableImageTypes": "Primary,Backdrop,Thumb",
            "GroupProgramsBySeries": "true",
            "EnableTotalRecordCount": "true",
          }
      ),
      options: Options(
          headers: {
            'X-Emby-Authorization': site.accessToken,
            'x-emby-token': site.accessToken,
          }
      ),
      cancelToken: cancelToken,
    );
    return EmbyResponse<Media>.fromJson(response.data, (json) => Media.fromJson(json));
  }

}


@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref)  => SearchRepository(
  client: ref.watch(dioProvider),
  site: ref.watch(embyStateServiceProvider.select((value) => value.site!)),
  embyToken: ref.watch(embyStateServiceProvider.select((value) => value.token)),
);

@riverpod
Future<EmbyResponse<Media>> getSearchRecommend(GetSearchRecommendRef ref) async {
  final cancelToken = ref.cancelToken();
  return ref.read(searchRepositoryProvider).getSearchRecommend(cancelToken: cancelToken);
}

@riverpod
Future<EmbyResponse<Media>> embySearch(EmbySearchRef ref, String query) async {
  final cancelToken = ref.cancelToken();
  return ref.read(searchRepositoryProvider).search(query: query, cancelToken: cancelToken);
}
