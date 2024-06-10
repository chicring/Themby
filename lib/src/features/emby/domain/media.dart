import 'package:themby/src/features/emby/domain/image_tags.dart';

import 'user_data.dart';

class Media {
  String sortName;
  String dateCreated;
  List<String> airDays;
  List<String> backdropImageTags;
  bool canDelete;
  String id;
  String parentBackdropItemId;
  List<String> parentBackdropImageTags;
  String parentThumbItemId;
  String parentThumbImageTag;
  String seasonId;
  String seasonName;
  String seriesId;
  String seriesName;
  ImageTags imageTags;
  String primary;
  String thumb;
  bool isFolder;
  String name;
  String overview;
  double primaryImageAspectRatio;
  int productionYear;
  int runTimeTicks;
  int indexNumber;
  int parentIndexNumber;
  String serverId;
  String status;
  bool supportsSync;
  String type; // "Series"|"Movie"|"Episode"
  UserData userData;

  Media({
    required this.sortName,
    required this.dateCreated,
    required this.airDays,
    required this.backdropImageTags,
    required this.canDelete,
    required this.id,
    required this.parentBackdropItemId,
    required this.parentBackdropImageTags,
    required this.parentThumbItemId,
    required this.parentThumbImageTag,
    required this.seasonId,
    required this.seasonName,
    required this.seriesId,
    required this.seriesName,
    required this.imageTags,
    required this.primary,
    required this.thumb,
    required this.isFolder,
    required this.name,
    required this.overview,
    required this.primaryImageAspectRatio,
    required this.productionYear,
    required this.runTimeTicks,
    required this.indexNumber,
    required this.parentIndexNumber,
    required this.serverId,
    required this.status,
    required this.supportsSync,
    required this.type,
    required this.userData,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      sortName: json['SortName'] ?? '',
      dateCreated: json['DateCreated'] ?? '',
      airDays: List<String>.from(json['AirDays'] ?? []),
      backdropImageTags: List<String>.from(json['BackdropImageTags'] ?? []),
      canDelete: json['CanDelete'] ?? false,
      id: json['Id'] ?? '',
      parentBackdropItemId: json['ParentBackdropItemId'] ?? '',
      parentBackdropImageTags: List<String>.from(json['ParentBackdropImageTags'] ?? []),
      parentThumbItemId: json['ParentThumbItemId'] ?? '',
      parentThumbImageTag: json['ParentThumbImageTag'] ?? '',
      seasonId: json['SeasonId'] ?? '',
      seasonName: json['SeasonName'] ?? '',
      seriesId: json['SeriesId'] ?? '',
      seriesName: json['SeriesName'] ?? '',
      imageTags: ImageTags.fromJson(json['ImageTags']),
      primary: json['Primary'] ?? '',
      thumb: json['Thumb'] ?? '',
      isFolder: json['IsFolder'] ?? false,
      name: json['Name'] ?? '',
      overview: json['Overview'] ?? '',
      primaryImageAspectRatio: (json['PrimaryImageAspectRatio'] as num? ?? 0.0).toDouble(),
      productionYear: json['ProductionYear'] ?? 0,
      runTimeTicks: json['RunTimeTicks'] ?? 0,
      indexNumber: json['IndexNumber'] ?? 0,
      parentIndexNumber: json['ParentIndexNumber'] ?? 0,
      serverId: json['ServerId'] ?? '',
      status: json['Status'] ?? '',
      supportsSync: json['SupportsSync'] ?? false,
      type: json['Type'] ?? '',
      userData: UserData.fromJson(json['UserData'] ?? {}),
    );
  }
}