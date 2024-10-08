// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      name: json['Name'] as String?,
      originalTitle: json['OriginalTitle'] as String?,
      serverId: json['ServerId'] as String?,
      id: json['Id'] as String?,
      etag: json['Etag'] as String?,
      playlistItemId: json['PlaylistItemId'] as String?,
      dateCreated: json['DateCreated'] == null
          ? null
          : DateTime.parse(json['DateCreated'] as String),
      extraType: json['ExtraType'] as String?,
      canDelete: json['CanDelete'] as bool?,
      canDownload: json['CanDownload'] as bool?,
      hasSubtitles: json['HasSubtitles'] as bool?,
      preferredMetadataLanguage: json['PreferredMetadataLanguage'] as String?,
      preferredMetadataCountryCode:
          json['PreferredMetadataCountryCode'] as String?,
      supportsSync: json['SupportsSync'] as bool?,
      container: json['Container'] as String?,
      sortName: json['SortName'] as String?,
      forcedSortName: json['ForcedSortName'] as String?,
      premiereDate: json['PremiereDate'] == null
          ? null
          : DateTime.parse(json['PremiereDate'] as String),
      externalUrls: (json['ExternalUrls'] as List<dynamic>?)
          ?.map((e) => ExternalUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaSources: (json['MediaSources'] as List<dynamic>?)
          ?.map((e) => MediaSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      criticRating: (json['CriticRating'] as num?)?.toInt(),
      gameSystemId: (json['GameSystemId'] as num?)?.toInt(),
      gameSystem: json['GameSystem'] as String?,
      productionLocations: (json['ProductionLocations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      path: json['Path'] as String?,
      officialRating: json['OfficialRating'] as String?,
      customRating: json['CustomRating'] as String?,
      channelId: json['ChannelId'] as String?,
      channelName: json['ChannelName'] as String?,
      overview: json['Overview'] as String?,
      taglines: (json['Taglines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      genres:
          (json['Genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      communityRating: json['CommunityRating'] as num?,
      runTimeTicks: (json['RunTimeTicks'] as num?)?.toInt(),
      playAccess: json['PlayAccess'] as String?,
      aspectRatio: json['AspectRatio'] as String?,
      productionYear: (json['ProductionYear'] as num?)?.toInt(),
      number: json['Number'] as String?,
      channelNumber: json['ChannelNumber'] as String?,
      indexNumber: (json['IndexNumber'] as num?)?.toInt(),
      indexNumberEnd: (json['IndexNumberEnd'] as num?)?.toInt(),
      parentIndexNumber: (json['ParentIndexNumber'] as num?)?.toInt(),
      remoteTrailers: (json['RemoteTrailers'] as List<dynamic>?)
          ?.map((e) => ExternalUrl.fromJson(e as Map<String, dynamic>))
          .toList(),
      providerIds: json['ProviderIds'] == null
          ? null
          : ImageTags.fromJson(json['ProviderIds'] as Map<String, dynamic>),
      isFolder: json['IsFolder'] as bool?,
      parentId: json['ParentId'] as String?,
      type: json['Type'] as String?,
      people: (json['People'] as List<dynamic>?)
          ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
      studios: (json['Studios'] as List<dynamic>?)
          ?.map((e) => GenreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      genreItems: (json['GenreItems'] as List<dynamic>?)
          ?.map((e) => GenreItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      parentLogoItemId: json['ParentLogoItemId'] as String?,
      parentBackdropItemId: json['ParentBackdropItemId'] as String?,
      parentBackdropImageTags:
          (json['ParentBackdropImageTags'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      localTrailerCount: (json['LocalTrailerCount'] as num?)?.toInt(),
      userData: json['UserData'] == null
          ? null
          : UserData.fromJson(json['UserData'] as Map<String, dynamic>),
      recursiveItemCount: (json['RecursiveItemCount'] as num?)?.toInt(),
      childCount: (json['ChildCount'] as num?)?.toInt(),
      seriesName: json['SeriesName'] as String?,
      seriesId: json['SeriesId'] as String?,
      seasonId: json['SeasonId'] as String?,
      specialFeatureCount: (json['SpecialFeatureCount'] as num?)?.toInt(),
      displayPreferencesId: json['DisplayPreferencesId'] as String?,
      tags: (json['Tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      primaryImageAspectRatio: json['PrimaryImageAspectRatio'] as num?,
      collectionType: json['CollectionType'] as String?,
      displayOrder: json['DisplayOrder'] as String?,
      seriesPrimaryImageTag: json['SeriesPrimaryImageTag'] as String?,
      seasonName: json['SeasonName'] as String?,
      mediaStreams: (json['MediaStreams'] as List<dynamic>?)
          ?.map((e) => MediaStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      partCount: (json['PartCount'] as num?)?.toInt(),
      imageTags: json['ImageTags'] == null
          ? null
          : ImageTags.fromJson(json['ImageTags'] as Map<String, dynamic>),
      backdropImageTags: (json['BackdropImageTags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parentLogoImageTag: json['ParentLogoImageTag'] as String?,
      parentArtItemId: json['ParentArtItemId'] as String?,
      parentArtImageTag: json['ParentArtImageTag'] as String?,
      seriesThumbImageTag: json['SeriesThumbImageTag'] as String?,
      seriesStudio: json['SeriesStudio'] as String?,
      parentThumbItemId: json['ParentThumbItemId'] as String?,
      parentThumbImageTag: json['ParentThumbImageTag'] as String?,
      parentPrimaryImageItemId: json['ParentPrimaryImageItemId'] as String?,
      parentPrimaryImageTag: json['ParentPrimaryImageTag'] as String?,
      chapters: (json['Chapters'] as List<dynamic>?)
          ?.map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      mediaType: json['MediaType'] as String?,
      endDate: json['EndDate'] == null
          ? null
          : DateTime.parse(json['EndDate'] as String),
      lockedFields: (json['LockedFields'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lockData: json['LockData'] as bool?,
      width: (json['Width'] as num?)?.toInt(),
      height: (json['Height'] as num?)?.toInt(),
      cameraMake: json['CameraMake'] as String?,
      cameraModel: json['CameraModel'] as String?,
      software: json['Software'] as String?,
      exposureTime: (json['ExposureTime'] as num?)?.toInt(),
      focalLength: (json['FocalLength'] as num?)?.toInt(),
      imageOrientation: json['ImageOrientation'] as String?,
      aperture: (json['Aperture'] as num?)?.toInt(),
      shutterSpeed: (json['ShutterSpeed'] as num?)?.toInt(),
      latitude: (json['Latitude'] as num?)?.toInt(),
      longitude: (json['Longitude'] as num?)?.toInt(),
      altitude: (json['Altitude'] as num?)?.toInt(),
      seriesTimerId: json['SeriesTimerId'] as String?,
      channelPrimaryImageTag: json['ChannelPrimaryImageTag'] as String?,
      startDate: json['StartDate'] == null
          ? null
          : DateTime.parse(json['StartDate'] as String),
      completionPercentage: (json['CompletionPercentage'] as num?)?.toInt(),
      isRepeat: json['IsRepeat'] as bool?,
      isNew: json['IsNew'] as bool?,
      episodeTitle: json['EpisodeTitle'] as String?,
      isMovie: json['IsMovie'] as bool?,
      isSports: json['IsSports'] as bool?,
      isSeries: json['IsSeries'] as bool?,
      isLive: json['IsLive'] as bool?,
      isNews: json['IsNews'] as bool?,
      isKids: json['IsKids'] as bool?,
      isPremiere: json['IsPremiere'] as bool?,
      timerId: json['TimerId'] as String?,
      currentProgram: json['CurrentProgram'] as String?,
      movieCount: (json['MovieCount'] as num?)?.toInt(),
      seriesCount: (json['SeriesCount'] as num?)?.toInt(),
      imagesCustom: json['ImagesCustom'] == null
          ? null
          : ImagesCustom.fromJson(json['ImagesCustom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'Name': instance.name,
      'OriginalTitle': instance.originalTitle,
      'ServerId': instance.serverId,
      'Id': instance.id,
      'Etag': instance.etag,
      'PlaylistItemId': instance.playlistItemId,
      'DateCreated': instance.dateCreated?.toIso8601String(),
      'ExtraType': instance.extraType,
      'CanDelete': instance.canDelete,
      'CanDownload': instance.canDownload,
      'HasSubtitles': instance.hasSubtitles,
      'PreferredMetadataLanguage': instance.preferredMetadataLanguage,
      'PreferredMetadataCountryCode': instance.preferredMetadataCountryCode,
      'SupportsSync': instance.supportsSync,
      'Container': instance.container,
      'SortName': instance.sortName,
      'ForcedSortName': instance.forcedSortName,
      'PremiereDate': instance.premiereDate?.toIso8601String(),
      'ExternalUrls': instance.externalUrls,
      'MediaSources': instance.mediaSources,
      'CriticRating': instance.criticRating,
      'GameSystemId': instance.gameSystemId,
      'GameSystem': instance.gameSystem,
      'ProductionLocations': instance.productionLocations,
      'Path': instance.path,
      'OfficialRating': instance.officialRating,
      'CustomRating': instance.customRating,
      'ChannelId': instance.channelId,
      'ChannelName': instance.channelName,
      'Overview': instance.overview,
      'Taglines': instance.taglines,
      'Genres': instance.genres,
      'CommunityRating': instance.communityRating,
      'RunTimeTicks': instance.runTimeTicks,
      'PlayAccess': instance.playAccess,
      'AspectRatio': instance.aspectRatio,
      'ProductionYear': instance.productionYear,
      'Number': instance.number,
      'ChannelNumber': instance.channelNumber,
      'IndexNumber': instance.indexNumber,
      'IndexNumberEnd': instance.indexNumberEnd,
      'ParentIndexNumber': instance.parentIndexNumber,
      'RemoteTrailers': instance.remoteTrailers,
      'ProviderIds': instance.providerIds,
      'IsFolder': instance.isFolder,
      'ParentId': instance.parentId,
      'Type': instance.type,
      'People': instance.people,
      'Studios': instance.studios,
      'GenreItems': instance.genreItems,
      'ParentLogoItemId': instance.parentLogoItemId,
      'ParentBackdropItemId': instance.parentBackdropItemId,
      'ParentBackdropImageTags': instance.parentBackdropImageTags,
      'LocalTrailerCount': instance.localTrailerCount,
      'UserData': instance.userData,
      'RecursiveItemCount': instance.recursiveItemCount,
      'ChildCount': instance.childCount,
      'SeriesName': instance.seriesName,
      'SeriesId': instance.seriesId,
      'SeasonId': instance.seasonId,
      'SpecialFeatureCount': instance.specialFeatureCount,
      'DisplayPreferencesId': instance.displayPreferencesId,
      'Tags': instance.tags,
      'PrimaryImageAspectRatio': instance.primaryImageAspectRatio,
      'CollectionType': instance.collectionType,
      'DisplayOrder': instance.displayOrder,
      'SeriesPrimaryImageTag': instance.seriesPrimaryImageTag,
      'SeasonName': instance.seasonName,
      'MediaStreams': instance.mediaStreams,
      'PartCount': instance.partCount,
      'ImageTags': instance.imageTags,
      'BackdropImageTags': instance.backdropImageTags,
      'ParentLogoImageTag': instance.parentLogoImageTag,
      'ParentArtItemId': instance.parentArtItemId,
      'ParentArtImageTag': instance.parentArtImageTag,
      'SeriesThumbImageTag': instance.seriesThumbImageTag,
      'SeriesStudio': instance.seriesStudio,
      'ParentThumbItemId': instance.parentThumbItemId,
      'ParentThumbImageTag': instance.parentThumbImageTag,
      'ParentPrimaryImageItemId': instance.parentPrimaryImageItemId,
      'ParentPrimaryImageTag': instance.parentPrimaryImageTag,
      'Chapters': instance.chapters,
      'MediaType': instance.mediaType,
      'EndDate': instance.endDate?.toIso8601String(),
      'LockedFields': instance.lockedFields,
      'LockData': instance.lockData,
      'Width': instance.width,
      'Height': instance.height,
      'CameraMake': instance.cameraMake,
      'CameraModel': instance.cameraModel,
      'Software': instance.software,
      'ExposureTime': instance.exposureTime,
      'FocalLength': instance.focalLength,
      'ImageOrientation': instance.imageOrientation,
      'Aperture': instance.aperture,
      'ShutterSpeed': instance.shutterSpeed,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'Altitude': instance.altitude,
      'SeriesTimerId': instance.seriesTimerId,
      'ChannelPrimaryImageTag': instance.channelPrimaryImageTag,
      'StartDate': instance.startDate?.toIso8601String(),
      'CompletionPercentage': instance.completionPercentage,
      'IsRepeat': instance.isRepeat,
      'IsNew': instance.isNew,
      'EpisodeTitle': instance.episodeTitle,
      'IsMovie': instance.isMovie,
      'IsSports': instance.isSports,
      'IsSeries': instance.isSeries,
      'IsLive': instance.isLive,
      'IsNews': instance.isNews,
      'IsKids': instance.isKids,
      'IsPremiere': instance.isPremiere,
      'TimerId': instance.timerId,
      'CurrentProgram': instance.currentProgram,
      'MovieCount': instance.movieCount,
      'SeriesCount': instance.seriesCount,
      'ImagesCustom': instance.imagesCustom,
    };
