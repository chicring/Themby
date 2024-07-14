import 'package:themby/src/features/emby/domain/user_data.dart';

import 'image_tags.dart';

class Resume {
  Resume({
    required this.name,
    required this.serverId,
    required this.id,
    required this.runTimeTicks,
    required this.productionYear,
    required this.indexNumber,
    required this.parentIndexNumber,
    required this.isFolder,
    required this.type,
    required this.parentBackdropItemId,
    required this.parentBackdropImageTags,
    required this.userData,
    required this.seriesName,
    required this.seriesId,
    required this.seasonId,
    required this.primaryImageAspectRatio,
    required this.seriesPrimaryImageTag,
    required this.seasonName,
    required this.imageTags,
    required this.backdropImageTags,
    required this.mediaType,
  });

  final String? name;
  final String? serverId;
  final String? id;
  final int? runTimeTicks;
  final int? productionYear;
  final int? indexNumber;
  final int? parentIndexNumber;
  final bool? isFolder;
  final String? type;
  final String? parentBackdropItemId;
  final List<String> parentBackdropImageTags;
  final UserData? userData;
  final String? seriesName;
  final String? seriesId;
  final String? seasonId;
  final double? primaryImageAspectRatio;
  final String? seriesPrimaryImageTag;
  final String? seasonName;
  final ImageTags? imageTags;
  final List<dynamic> backdropImageTags;
  final String? mediaType;

  factory Resume.fromJson(Map<String, dynamic> json){
    return Resume(
      name: json["Name"],
      serverId: json["ServerId"],
      id: json["Id"],
      runTimeTicks: json["RunTimeTicks"],
      productionYear: json["ProductionYear"],
      indexNumber: json["IndexNumber"],
      parentIndexNumber: json["ParentIndexNumber"],
      isFolder: json["IsFolder"],
      type: json["Type"],
      parentBackdropItemId: json["ParentBackdropItemId"],
      parentBackdropImageTags: json["ParentBackdropImageTags"] == null ? [] : List<String>.from(json["ParentBackdropImageTags"]!.map((x) => x)),
      userData: json["UserData"] == null ? null : UserData.fromJson(json["UserData"]),
      seriesName: json["SeriesName"],
      seriesId: json["SeriesId"],
      seasonId: json["SeasonId"],
      primaryImageAspectRatio: json["PrimaryImageAspectRatio"],
      seriesPrimaryImageTag: json["SeriesPrimaryImageTag"],
      seasonName: json["SeasonName"],
      imageTags: json["ImageTags"] == null ? null : ImageTags.fromJson(json["ImageTags"]),
      backdropImageTags: json["BackdropImageTags"] == null ? [] : List<dynamic>.from(json["BackdropImageTags"]!.map((x) => x)),
      mediaType: json["MediaType"],
    );
  }
}