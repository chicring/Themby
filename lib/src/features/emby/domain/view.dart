import 'image_tags.dart';

class ViewDetail {
  List<String> backdropImageTags;
  bool canDelete;
  bool canDownload;
  int childCount;
  String collectionType;
  String dateCreated;
  String displayPreferencesId;
  String etag;
  List<String> externalUrls;
  String fileName;
  String forcedSortName;
  String guid;
  String id;
  ImageTags imageTags;
  bool isFolder;
  bool lockData;
  List<String> lockedFields;
  String name;
  String parentId;
  String path;
  String playAccess;
  String presentationUniqueKey;
  double primaryImageAspectRatio;
  Map<String, dynamic> providerIds;
  List<String> remoteTrailers;
  String serverId;
  String sortName;
  List<String> taglines;
  String type;

  ViewDetail({
    required this.backdropImageTags,
    required this.canDelete,
    required this.canDownload,
    required this.childCount,
    required this.collectionType,
    required this.dateCreated,
    required this.displayPreferencesId,
    required this.etag,
    required this.externalUrls,
    required this.fileName,
    required this.forcedSortName,
    required this.guid,
    required this.id,
    required this.imageTags,
    required this.isFolder,
    required this.lockData,
    required this.lockedFields,
    required this.name,
    required this.parentId,
    required this.path,
    required this.playAccess,
    required this.presentationUniqueKey,
    required this.primaryImageAspectRatio,
    required this.providerIds,
    required this.remoteTrailers,
    required this.serverId,
    required this.sortName,
    required this.taglines,
    required this.type,
  });

  // 添加 toJson 方法以序列化为 JSON
  Map<String, dynamic> toJson() => {
    "BackdropImageTags": backdropImageTags,
    "CanDelete": canDelete,
    "CanDownload": canDownload,
    "ChildCount": childCount,
    "CollectionType": collectionType,
    "DateCreated": dateCreated,
    "DisplayPreferencesId": displayPreferencesId,
    "Etag": etag,
    "ExternalUrls": externalUrls,
    "FileName": fileName,
    "ForcedSortName": forcedSortName,
    "Guid": guid,
    "Id": id,
    "ImageTags": imageTags,
    "IsFolder": isFolder,
    "LockData": lockData,
    "LockedFields": lockedFields,
    "Name": name,
    "ParentId": parentId,
    "Path": path,
    "PlayAccess": playAccess,
    "PresentationUniqueKey": presentationUniqueKey,
    "PrimaryImageAspectRatio": primaryImageAspectRatio,
    "ProviderIds": providerIds,
    "RemoteTrailers": remoteTrailers,
    "ServerId": serverId,
    "SortName": sortName,
    "Taglines": taglines,
    "Type": type,
  };


  factory ViewDetail.fromJson(Map<String, dynamic> json) {
    return ViewDetail(
      backdropImageTags: List<String>.from(json["BackdropImageTags"].map((x) => x)),
      canDelete: json["CanDelete"]  ?? false,
      canDownload: json["CanDownload"] ?? false,
      childCount: json["ChildCount"] ?? 0,
      collectionType: json["CollectionType"] ?? "",
      dateCreated: json["DateCreated"] ?? "",
      displayPreferencesId: json["DisplayPreferencesId"] ?? "",
      etag: json["Etag"]  ?? "",
      externalUrls: List<String>.from(json["ExternalUrls"].map((x) => x)),
      fileName: json["FileName"] ?? "",
      forcedSortName: json["ForcedSortName"] ?? "",
      guid: json["Guid"]  ?? "",
      id: json["Id"] ?? "",
      imageTags: ImageTags.fromJson(json["ImageTags"]),
      isFolder: json["IsFolder"] ?? false,
      lockData: json["LockData"] ?? false,
      lockedFields: List<String>.from(json["LockedFields"].map((x) => x)) ?? [],
      name: json["Name"]  ?? "",
      parentId: json["ParentId"] ?? "",
      path: json["Path"] ?? "",
      playAccess: json["PlayAccess"] ?? "",
      presentationUniqueKey: json["PresentationUniqueKey"] ?? "",
      primaryImageAspectRatio: (json["PrimaryImageAspectRatio"] ?? 0).toDouble(),
      providerIds: Map<String, dynamic>.from(json["ProviderIds"]),
      remoteTrailers: List<String>.from(json["RemoteTrailers"].map((x) => x)),
      serverId: json["ServerId"],
      sortName: json["SortName"],
      taglines: List<String>.from(json["Taglines"].map((x) => x)),
      type: json["Type"],
    );
  }
}

// Dart 对应的 View 类
class View {
  int totalRecordCount;
  List<ViewDetail> items;

  View({
    required this.totalRecordCount,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
    "TotalRecordCount": totalRecordCount,
    "Items": List<dynamic>.from(items.map((x) => x.toJson())),
  };

  factory View.fromJson(Map<String, dynamic> json) {
    return View(
      totalRecordCount: json["TotalRecordCount"],
      items: List<ViewDetail>.from(json["Items"].map((x) => ViewDetail.fromJson(x))),
    );
  }
}