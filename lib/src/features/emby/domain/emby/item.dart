import 'package:json_annotation/json_annotation.dart';

import 'album_artist.dart';
import 'chapter.dart';
import 'custom/images_custom.dart';
import 'external_url.dart';
import 'genre_item.dart';
import 'image_tags.dart';
import 'media_source.dart';
import 'media_stream.dart';
import 'person.dart';
import 'user_data.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "OriginalTitle")
  String? originalTitle;
  @JsonKey(name: "ServerId")
  String? serverId;
  @JsonKey(name: "Id")
  String? id;
  @JsonKey(name: "Etag")
  String? etag;
  @JsonKey(name: "PlaylistItemId")
  String? playlistItemId;
  @JsonKey(name: "DateCreated")
  DateTime? dateCreated;
  @JsonKey(name: "ExtraType")
  String? extraType;
  // @JsonKey(name: "AirsBeforeSeasonNumber")
  // int? airsBeforeSeasonNumber;
  // @JsonKey(name: "AirsAfterSeasonNumber")
  // int? airsAfterSeasonNumber;
  // @JsonKey(name: "AirsBeforeEpisodeNumber")
  // int? airsBeforeEpisodeNumber;
  // @JsonKey(name: "DisplaySpecialsWithSeasons")
  // bool? displaySpecialsWithSeasons;
  @JsonKey(name: "CanDelete")
  bool? canDelete;
  @JsonKey(name: "CanDownload")
  bool? canDownload;
  @JsonKey(name: "HasSubtitles")
  bool? hasSubtitles;
  // @JsonKey(name: "SupportsResume")
  // bool? supportsResume;
  @JsonKey(name: "PreferredMetadataLanguage")
  String? preferredMetadataLanguage;
  @JsonKey(name: "PreferredMetadataCountryCode")
  String? preferredMetadataCountryCode;
  @JsonKey(name: "SupportsSync")
  bool? supportsSync;
  @JsonKey(name: "Container")
  String? container;
  @JsonKey(name: "SortName")
  String? sortName;
  @JsonKey(name: "ForcedSortName")
  String? forcedSortName;
  // @JsonKey(name: "Video3DFormat")
  // String? video3DFormat;
  @JsonKey(name: "PremiereDate")
  DateTime? premiereDate;
  @JsonKey(name: "ExternalUrls")
  List<ExternalUrl>? externalUrls;
  @JsonKey(name: "MediaSources")
  List<MediaSource>? mediaSources;
  @JsonKey(name: "CriticRating")
  int? criticRating;
  @JsonKey(name: "GameSystemId")
  int? gameSystemId;
  @JsonKey(name: "GameSystem")
  String? gameSystem;
  @JsonKey(name: "ProductionLocations")
  List<String>? productionLocations;
  @JsonKey(name: "Path")
  String? path;
  @JsonKey(name: "OfficialRating")
  String? officialRating;
  @JsonKey(name: "CustomRating")
  String? customRating;
  @JsonKey(name: "ChannelId")
  String? channelId;
  @JsonKey(name: "ChannelName")
  String? channelName;
  @JsonKey(name: "Overview")
  String? overview;
  @JsonKey(name: "Taglines")
  List<String>? taglines;
  @JsonKey(name: "Genres")
  List<String>? genres;
  @JsonKey(name: "CommunityRating")
  num? communityRating;
  @JsonKey(name: "RunTimeTicks")
  int? runTimeTicks;
  @JsonKey(name: "PlayAccess")
  String? playAccess;
  @JsonKey(name: "AspectRatio")
  String? aspectRatio;
  @JsonKey(name: "ProductionYear")
  int? productionYear;
  @JsonKey(name: "Number")
  String? number;
  @JsonKey(name: "ChannelNumber")
  String? channelNumber;
  @JsonKey(name: "IndexNumber")
  int? indexNumber;
  @JsonKey(name: "IndexNumberEnd")
  int? indexNumberEnd;
  @JsonKey(name: "ParentIndexNumber")
  int? parentIndexNumber;
  @JsonKey(name: "RemoteTrailers")
  List<ExternalUrl>? remoteTrailers;
  @JsonKey(name: "ProviderIds")
  ImageTags? providerIds;
  @JsonKey(name: "IsFolder")
  bool? isFolder;
  @JsonKey(name: "ParentId")
  String? parentId;
  @JsonKey(name: "Type")
  String? type;
  @JsonKey(name: "People")
  List<Person>? people;
  @JsonKey(name: "Studios")
  List<GenreItem>? studios;
  @JsonKey(name: "GenreItems")
  List<GenreItem>? genreItems;
  @JsonKey(name: "ParentLogoItemId")
  String? parentLogoItemId;
  @JsonKey(name: "ParentBackdropItemId")
  String? parentBackdropItemId;
  @JsonKey(name: "ParentBackdropImageTags")
  List<String>? parentBackdropImageTags;
  @JsonKey(name: "LocalTrailerCount")
  int? localTrailerCount;
  @JsonKey(name: "UserData")
  UserData? userData;
  @JsonKey(name: "RecursiveItemCount")
  int? recursiveItemCount;
  @JsonKey(name: "ChildCount")
  int? childCount;
  @JsonKey(name: "SeriesName")
  String? seriesName;
  @JsonKey(name: "SeriesId")
  String? seriesId;
  @JsonKey(name: "SeasonId")
  String? seasonId;
  @JsonKey(name: "SpecialFeatureCount")
  int? specialFeatureCount;
  @JsonKey(name: "DisplayPreferencesId")
  String? displayPreferencesId;
  // @JsonKey(name: "Status")
  // String? status;
  // @JsonKey(name: "AirTime")
  // String? airTime;
  // @JsonKey(name: "AirDays")
  // List<String>? airDays;
  @JsonKey(name: "Tags")
  List<String>? tags;
  @JsonKey(name: "PrimaryImageAspectRatio")
  num? primaryImageAspectRatio;
  // @JsonKey(name: "Artists")
  // List<String>? artists;
  // @JsonKey(name: "ArtistItems")
  // List<AlbumArtist>? artistItems;
  // @JsonKey(name: "Album")
  // String? album;
  @JsonKey(name: "CollectionType")
  String? collectionType;
  @JsonKey(name: "DisplayOrder")
  String? displayOrder;
  // @JsonKey(name: "AlbumId")
  // String? albumId;
  // @JsonKey(name: "AlbumPrimaryImageTag")
  // String? albumPrimaryImageTag;
  @JsonKey(name: "SeriesPrimaryImageTag")
  String? seriesPrimaryImageTag;
  // @JsonKey(name: "AlbumArtist")
  // String? albumArtist;
  // @JsonKey(name: "AlbumArtists")
  // List<AlbumArtist>? albumArtists;
  @JsonKey(name: "SeasonName")
  String? seasonName;
  @JsonKey(name: "MediaStreams")
  List<MediaStream>? mediaStreams;
  @JsonKey(name: "PartCount")
  int? partCount;
  @JsonKey(name: "ImageTags")
  ImageTags? imageTags;
  @JsonKey(name: "BackdropImageTags")
  List<String>? backdropImageTags;
  @JsonKey(name: "ParentLogoImageTag")
  String? parentLogoImageTag;
  @JsonKey(name: "ParentArtItemId")
  String? parentArtItemId;
  @JsonKey(name: "ParentArtImageTag")
  String? parentArtImageTag;
  @JsonKey(name: "SeriesThumbImageTag")
  String? seriesThumbImageTag;
  @JsonKey(name: "SeriesStudio")
  String? seriesStudio;
  @JsonKey(name: "ParentThumbItemId")
  String? parentThumbItemId;
  @JsonKey(name: "ParentThumbImageTag")
  String? parentThumbImageTag;
  @JsonKey(name: "ParentPrimaryImageItemId")
  String? parentPrimaryImageItemId;
  @JsonKey(name: "ParentPrimaryImageTag")
  String? parentPrimaryImageTag;
  @JsonKey(name: "Chapters")
  List<Chapter>? chapters;
  // @JsonKey(name: "LocationType")
  // String? locationType;
  @JsonKey(name: "MediaType")
  String? mediaType;
  @JsonKey(name: "EndDate")
  DateTime? endDate;
  @JsonKey(name: "LockedFields")
  List<String>? lockedFields;
  @JsonKey(name: "LockData")
  bool? lockData;
  @JsonKey(name: "Width")
  int? width;
  @JsonKey(name: "Height")
  int? height;
  @JsonKey(name: "CameraMake")
  String? cameraMake;
  @JsonKey(name: "CameraModel")
  String? cameraModel;
  @JsonKey(name: "Software")
  String? software;
  @JsonKey(name: "ExposureTime")
  int? exposureTime;
  @JsonKey(name: "FocalLength")
  int? focalLength;
  @JsonKey(name: "ImageOrientation")
  String? imageOrientation;
  @JsonKey(name: "Aperture")
  int? aperture;
  @JsonKey(name: "ShutterSpeed")
  int? shutterSpeed;
  @JsonKey(name: "Latitude")
  int? latitude;
  @JsonKey(name: "Longitude")
  int? longitude;
  @JsonKey(name: "Altitude")
  int? altitude;
  // @JsonKey(name: "IsoSpeedRating")
  // int? isoSpeedRating;
  @JsonKey(name: "SeriesTimerId")
  String? seriesTimerId;
  @JsonKey(name: "ChannelPrimaryImageTag")
  String? channelPrimaryImageTag;
  @JsonKey(name: "StartDate")
  DateTime? startDate;
  @JsonKey(name: "CompletionPercentage")
  int? completionPercentage;
  @JsonKey(name: "IsRepeat")
  bool? isRepeat;
  @JsonKey(name: "IsNew")
  bool? isNew;
  @JsonKey(name: "EpisodeTitle")
  String? episodeTitle;
  @JsonKey(name: "IsMovie")
  bool? isMovie;
  @JsonKey(name: "IsSports")
  bool? isSports;
  @JsonKey(name: "IsSeries")
  bool? isSeries;
  @JsonKey(name: "IsLive")
  bool? isLive;
  @JsonKey(name: "IsNews")
  bool? isNews;
  @JsonKey(name: "IsKids")
  bool? isKids;
  @JsonKey(name: "IsPremiere")
  bool? isPremiere;
  @JsonKey(name: "TimerId")
  String? timerId;
  @JsonKey(name: "CurrentProgram")
  String? currentProgram;
  @JsonKey(name: "MovieCount")
  int? movieCount;
  @JsonKey(name: "SeriesCount")
  int? seriesCount;
  // @JsonKey(name: "AlbumCount")
  // int? albumCount;
  // @JsonKey(name: "SongCount")
  // int? songCount;
  // @JsonKey(name: "MusicVideoCount")
  // int? musicVideoCount;
  @JsonKey(ignore: true)
  ImagesCustom? imagesCustom;

  Item({
    this.name,
    this.originalTitle,
    this.serverId,
    this.id,
    this.etag,
    this.playlistItemId,
    this.dateCreated,
    this.extraType,
    this.canDelete,
    this.canDownload,
    this.hasSubtitles,
    this.preferredMetadataLanguage,
    this.preferredMetadataCountryCode,
    this.supportsSync,
    this.container,
    this.sortName,
    this.forcedSortName,
    this.premiereDate,
    this.externalUrls,
    this.mediaSources,
    this.criticRating,
    this.gameSystemId,
    this.gameSystem,
    this.productionLocations,
    this.path,
    this.officialRating,
    this.customRating,
    this.channelId,
    this.channelName,
    this.overview,
    this.taglines,
    this.genres,
    this.communityRating,
    this.runTimeTicks,
    this.playAccess,
    this.aspectRatio,
    this.productionYear,
    this.number,
    this.channelNumber,
    this.indexNumber,
    this.indexNumberEnd,
    this.parentIndexNumber,
    this.remoteTrailers,
    this.providerIds,
    this.isFolder,
    this.parentId,
    this.type,
    this.people,
    this.studios,
    this.genreItems,
    this.parentLogoItemId,
    this.parentBackdropItemId,
    this.parentBackdropImageTags,
    this.localTrailerCount,
    this.userData,
    this.recursiveItemCount,
    this.childCount,
    this.seriesName,
    this.seriesId,
    this.seasonId,
    this.specialFeatureCount,
    this.displayPreferencesId,
    this.tags,
    this.primaryImageAspectRatio,
    this.collectionType,
    this.displayOrder,
    this.seriesPrimaryImageTag,
    this.seasonName,
    this.mediaStreams,
    this.partCount,
    this.imageTags,
    this.backdropImageTags,
    this.parentLogoImageTag,
    this.parentArtItemId,
    this.parentArtImageTag,
    this.seriesThumbImageTag,
    this.seriesStudio,
    this.parentThumbItemId,
    this.parentThumbImageTag,
    this.parentPrimaryImageItemId,
    this.parentPrimaryImageTag,
    this.chapters,
    this.mediaType,
    this.endDate,
    this.lockedFields,
    this.lockData,
    this.width,
    this.height,
    this.cameraMake,
    this.cameraModel,
    this.software,
    this.exposureTime,
    this.focalLength,
    this.imageOrientation,
    this.aperture,
    this.shutterSpeed,
    this.latitude,
    this.longitude,
    this.altitude,
    this.seriesTimerId,
    this.channelPrimaryImageTag,
    this.startDate,
    this.completionPercentage,
    this.isRepeat,
    this.isNew,
    this.episodeTitle,
    this.isMovie,
    this.isSports,
    this.isSeries,
    this.isLive,
    this.isNews,
    this.isKids,
    this.isPremiere,
    this.timerId,
    this.currentProgram,
    this.movieCount,
    this.seriesCount,
    this.imagesCustom,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
















