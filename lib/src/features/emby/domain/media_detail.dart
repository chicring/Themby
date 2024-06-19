


// Name: string
// OriginalTitle: string
// Overview: string
// Genres: string[]
// BackdropImageTags: string[]
// CollectionType: "tvshows"|"movies"
// Id: string
// Etag: string
// Type: "Series"|"Movie"|"Playlist"|string
// ImageTags: {
// Banner: string
// Logo: string
// Primary: string
// Thumb: string
// }
// UserData: UserData
// People?: People[]
// SeriesId: string
// SeriesName: string
// MediaSources?: MediaSource[]


import 'image_tags.dart';
import 'people.dart';
import 'playback_info.dart';
import 'user_data.dart';

class MediaDetail{
  String name;
  String originalTitle;
  String overview;
  List<String> genres;
  List<String> backdropImageTags;
  String collectionType;
  String id;
  String etag;
  String type;
  ImageTags imageTags;
  UserData userData;
  List<People> people;
  String seriesId;
  String seriesName;
  List<MediaSource> mediaSources;

  MediaDetail({
    required this.name,
    required this.originalTitle,
    required this.overview,
    required this.genres,
    required this.backdropImageTags,
    required this.collectionType,
    required this.id,
    required this.etag,
    required this.type,
    required this.imageTags,
    required this.userData,
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
      collectionType: json['CollectionType'],
      id: json['Id'],
      etag: json['Etag'],
      type: json['Type'],
      imageTags: ImageTags.fromJson(json['ImageTags']),
      userData: UserData.fromJson(json['UserData']),
      people: (json['People'] as List)
          .map((item) => People.fromJson(item))
          .toList(),
      seriesId: json['SeriesId'],
      seriesName: json['SeriesName'],
      mediaSources: (json['MediaSources'] as List)
          .map((item) => MediaSource.fromJson(item))
          .toList(),
    );
  }

}