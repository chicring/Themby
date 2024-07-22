
import 'image_tags.dart';
import 'people.dart';
import 'playback_info.dart';
import 'user_data.dart';

class ExternalUrl{
  String name;
  String url;

  ExternalUrl({
    required this.name,
    required this.url,
  });

  factory ExternalUrl.fromJson(Map<String, dynamic> json) {
    return ExternalUrl(
      name: json['Name'],
      url: json['Url'],
    );
  }
}

class MediaDetail{
  String name;
  String originalTitle;
  String overview;
  String communityRating;
  int runTimeTicks;
  String officialRating;
  List<String> genres;
  List<String> backdropImageTags;
  String collectionType;
  String id;
  String etag;
  String type;
  ImageTags imageTags;
  UserData userData;
  int productionYear;
  int indexNumber;
  int parentIndexNumber;
  List<People> people;
  String parentId;
  String seasonId;
  String seriesId;
  String seriesName;
  List<ExternalUrl> externalUrls;
  List<MediaSource> mediaSources;
  String mediaType;
  int childCount;

  MediaDetail({
    required this.name,
    required this.originalTitle,
    required this.overview,
    required this.genres,
    required this.communityRating,
    required this.runTimeTicks,
    required this.officialRating,
    required this.backdropImageTags,
    required this.collectionType,
    required this.id,
    required this.etag,
    required this.type,
    required this.imageTags,
    required this.userData,
    required this.productionYear,
    required this.indexNumber,
    required this.parentIndexNumber,
    required this.people,
    required this.parentId,
    required this.seasonId,
    required this.seriesId,
    required this.seriesName,
    required this.externalUrls,
    required this.mediaSources,
    required this.mediaType,
    required this.childCount,
  });

  factory MediaDetail.fromJson(Map<String, dynamic> json) {
    return MediaDetail(
      name: json['Name'],
      originalTitle: json['OriginalTitle'] ?? '',
      overview: json['Overview'] ?? '',
      genres: List<String>.from(json['Genres']),
      backdropImageTags: List<String>.from(json['BackdropImageTags']),
      communityRating: (((json['CommunityRating'] as num? ?? 0.0).toDouble()).toStringAsFixed(1)),
      runTimeTicks: json['RunTimeTicks'] ?? 0,
      officialRating: json['OfficialRating'] ?? '',
      collectionType: json['CollectionType'] ?? '',
      id: json['Id'],
      etag: json['Etag'],
      type: json['Type'],
      imageTags: ImageTags.fromJson(json['ImageTags']),
      userData: UserData.fromJson(json['UserData']),
      productionYear: json['ProductionYear'] ?? 0,
      indexNumber: json['IndexNumber'] ?? 0,
      parentIndexNumber: json['ParentIndexNumber'] ?? 0,
      people: (json['People'] as List)
          .map((item) => People.fromJson(item))
          .toList() ?? [],
      parentId: json['ParentId'] ?? '',
      seriesId: json['SeriesId'] ?? '',
      seasonId: json['SeasonId'] ?? '',
      seriesName: json['SeriesName'] ?? '',
      externalUrls: (json['ExternalUrls'] as List)
          .map((item) => ExternalUrl.fromJson(item))
          .toList(),
      mediaSources: json['MediaSources'] != null
          ? (json['MediaSources'] as List).map((item) => MediaSource.fromJson(item)).toList()
          : [],
      mediaType: json['MediaType'] ?? '',
      childCount: json['ChildCount'] ?? 0,
    );
  }

}