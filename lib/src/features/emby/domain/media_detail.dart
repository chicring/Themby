
import 'image_tags.dart';
import 'people.dart';
import 'playback_info.dart';
import 'user_data.dart';

class MediaDetail{
  String name;
  String originalTitle;
  String overview;
  String communityRating;
  List<String> genres;
  List<String> backdropImageTags;
  String collectionType;
  String id;
  String etag;
  String type;
  ImageTags imageTags;
  UserData userData;
  int productionYear;
  List<People> people;
  String seriesId;
  String seriesName;
  List<MediaSource> mediaSources;

  MediaDetail({
    required this.name,
    required this.originalTitle,
    required this.overview,
    required this.genres,
    required this.communityRating,
    required this.backdropImageTags,
    required this.collectionType,
    required this.id,
    required this.etag,
    required this.type,
    required this.imageTags,
    required this.userData,
    required this.productionYear,
    required this.people,
    required this.seriesId,
    required this.seriesName,
    required this.mediaSources,
  });

  factory MediaDetail.fromJson(Map<String, dynamic> json) {
    return MediaDetail(
      name: json['Name'],
      originalTitle: json['OriginalTitle'],
      overview: json['Overview'],
      genres: List<String>.from(json['Genres']),
      backdropImageTags: List<String>.from(json['BackdropImageTags']),
      communityRating: (((json['CommunityRating'] as num? ?? 0.0).toDouble()).toStringAsFixed(1)),
      collectionType: json['CollectionType'] ?? '',
      id: json['Id'],
      etag: json['Etag'],
      type: json['Type'],
      imageTags: ImageTags.fromJson(json['ImageTags']),
      userData: UserData.fromJson(json['UserData']),
      productionYear: json['ProductionYear'] ?? 0,
      people: (json['People'] as List)
          .map((item) => People.fromJson(item))
          .toList() ?? [],
      seriesId: json['SeriesId'] ?? '',
      seriesName: json['SeriesName'] ?? '',
      mediaSources: (json['MediaSources'] as List)
          .map((item) => MediaSource.fromJson(item))
          .toList(),
    );
  }

}