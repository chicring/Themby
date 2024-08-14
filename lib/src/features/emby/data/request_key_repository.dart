

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/emby_state_service.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';

part 'request_key_repository.g.dart';

@riverpod
String viewKey(ViewKeyRef ref){
  Site site =  ref.watch(embyStateServiceProvider.select((value) => value.site!));

  return Uri(
      scheme: site.scheme,
      host: site.host,
      port: site.port,
      path: '/emby/Users/${site.userId}/Views',
      queryParameters: {
        "MediaTypes": "Video",
        "Fields": "BasicSyncInfo,CanDelete,PrimaryImageAspectRatio,ProductionYear"
      }
  ).toString();
}

@riverpod
String resumeKey(ResumeKeyRef ref, {String? parentId }){
  Site site =  ref.watch(embyStateServiceProvider.select((value) => value.site!));

  return Uri(
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
  ).toString();
}

@riverpod
String suggestionKey(SuggestionKeyRef ref){
  Site site =  ref.watch(embyStateServiceProvider.select((value) => value.site!));

  return Uri(
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
  ).toString();
}

@riverpod
String lastMediaKey(LastMediaKeyRef ref,String parentId){
  Site site = ref.watch(embyStateServiceProvider.select((value) => value.site!));

  return Uri(
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
  ).toString();
}