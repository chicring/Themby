import 'package:themby/src/features/emby/domain/image_tags.dart';
import 'package:themby/src/features/emby/domain/user_data.dart';


class Season {
  List<String> backdropImageTags;
  bool canDelete;
  String id;
  ImageTags imageTags;
  int indexNumber;
  bool isFolder;
  String name;
  String? overview;
  double primaryImageAspectRatio;
  String seriesId;
  String seriesName;
  String seriesPrimaryImageTag;
  String serverId;
  bool supportsSync;
  String type;
  UserData userData;

  Season({
    required this.backdropImageTags,
    required this.canDelete,
    required this.id,
    required this.imageTags,
    required this.indexNumber,
    required this.isFolder,
    required this.name,
    this.overview,
    required this.primaryImageAspectRatio,
    required this.seriesId,
    required this.seriesName,
    required this.seriesPrimaryImageTag,
    required this.serverId,
    required this.supportsSync,
    required this.type,
    required this.userData,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      backdropImageTags: List<String>.from(json['BackdropImageTags']),
      canDelete: json['CanDelete'],
      id: json['Id'],
      imageTags: ImageTags.fromJson(json['ImageTags']),
      indexNumber: json['IndexNumber'],
      isFolder: json['IsFolder'],
      name: json['Name'],
      overview: json['Overview'],
      primaryImageAspectRatio: json['PrimaryImageAspectRatio'],
      seriesId: json['SeriesId'],
      seriesName: json['SeriesName'],
      seriesPrimaryImageTag: json['SeriesPrimaryImageTag'],
      serverId: json['ServerId'],
      supportsSync: json['SupportsSync'] ?? false,
      type: json['Type'],
      userData: UserData.fromJson(json['UserData']),

    );
  }
}

