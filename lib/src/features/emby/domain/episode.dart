

import 'package:themby/src/features/emby/domain/image_tags.dart';
import 'package:themby/src/features/emby/domain/user_data.dart';

class Episode {
  String id;
  String name;
  String overview;
  String seriesId;
  String seriesName;
  String seasonId;
  String seasonName;
  double primaryImageAspectRatio;
  int indexNumber;
  ImageTags imageTags;
  UserData userData;
  int runTimeTicks;

  Episode({
    required this.id,
    required this.name,
    required this.overview,
    required this.seriesId,
    required this.seriesName,
    required this.seasonId,
    required this.seasonName,
    required this.primaryImageAspectRatio,
    required this.indexNumber,
    required this.imageTags,
    required this.userData,
    required this.runTimeTicks,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      id: json['Id'],
      name: json['Name'],
      overview: json['Overview'] ?? '',
      seriesId: json['SeriesId'],
      seriesName: json['SeriesName'],
      seasonId: json['SeasonId'],
      seasonName: json['SeasonName'],
      primaryImageAspectRatio: json['PrimaryImageAspectRatio'] ?? 0.0,
      indexNumber: json['IndexNumber'] ?? 0,
      imageTags: ImageTags.fromJson(json['ImageTags']),
      userData: UserData.fromJson(json['UserData']),
      runTimeTicks: json['RunTimeTicks'] ?? 0,
    );
  }
}
