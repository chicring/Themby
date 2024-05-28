import 'package:themby/common/models/emby_image.dart';

class EmbyView {
  List<String>? backdropImageTags;
  bool? canDelete;
  bool? canDownload;
  int? childCount;
  String? collectionType;
  String? dateCreated;
  String? displayPreferencesId;
  String? etag;
  List<String>? externalUrls;
  String? fileName;
  String? forcedSortName;
  String? guid;
  String? id;
  Map<String, dynamic>? imageTags;
  String? primary;
  bool? isFolder;
  bool? lockData;
  List<String>? lockedFields;
  String? name;
  String? parentId;
  String? path;
  String? playAccess;
  String? presentationUniqueKey;
  double? primaryImageAspectRatio;
  Map<String, dynamic>? providerIds;
  List<String>? remoteTrailers;
  String? serverId;
  String? sortName;
  List<String>? taglines;
  String? type;
  Image? image;

  EmbyView({
    this.backdropImageTags,
    this.canDelete,
    this.canDownload,
    this.childCount,
    this.collectionType,
    this.dateCreated,
    this.displayPreferencesId,
    this.etag,
    this.externalUrls,
    this.fileName,
    this.forcedSortName,
    this.guid,
    this.id,
    this.imageTags,
    this.primary,
    this.isFolder,
    this.lockData,
    this.lockedFields,
    this.name,
    this.parentId,
    this.path,
    this.playAccess,
    this.presentationUniqueKey,
    this.primaryImageAspectRatio,
    this.providerIds,
    this.remoteTrailers,
    this.serverId,
    this.sortName,
    this.taglines,
    this.type,
    this.image,
  });


  EmbyView.fromJson(Map<String, dynamic> json) {
    backdropImageTags = json['BackdropImageTags'].cast<String>();
    canDelete = json['CanDelete'];
    canDownload = json['CanDownload'];
    childCount = json['ChildCount'];
    collectionType = json['CollectionType'];
    dateCreated = json['DateCreated'];
    displayPreferencesId = json['DisplayPreferencesId'];
    etag = json['Etag'];
    externalUrls = json['ExternalUrls'].cast<String>();
    fileName = json['FileName'];
    forcedSortName = json['ForcedSortName'];
    guid = json['Guid'];
    id = json['Id'];
    imageTags = json['ImageTags'];
    primary = json['Primary'];
    isFolder = json['IsFolder'];
    lockData = json['LockData'];
    lockedFields = json['LockedFields'].cast<String>();
    name = json['Name'];
    parentId = json['ParentId'];
    path = json['Path'];
    playAccess = json['PlayAccess'];
    presentationUniqueKey = json['PresentationUniqueKey'];
    primaryImageAspectRatio = json['PrimaryImageAspectRatio'].toDouble();
    providerIds = json['ProviderIds'];
    remoteTrailers = json['RemoteTrailers'].cast<String>();
    serverId = json['ServerId'];
    sortName = json['SortName'];
    taglines = json['Taglines'].cast<String>();
    type = json['Type'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

}