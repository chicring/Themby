import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';


String getImageUrl(Site site, String itemId, ImageProps? props) {
  final queryParameters = {
    if (props?.maxHeight != null) 'maxHeight': props!.maxHeight.toString(),
    if (props?.maxWidth != null) 'maxWidth': props!.maxWidth.toString(),
    if (props?.quality != null) 'quality': props!.quality.toString(),
    if (props?.tag != null) 'tag': props!.tag,
  };

  return Uri(
    scheme: site.scheme,
    host: site.host,
    port: site.port,
    path: '/emby/Items/$itemId/Images/${props?.type?.name}',
    queryParameters: queryParameters.isNotEmpty ? queryParameters : null,
  ).toString();
}


//拿到PrimaryImage, 如果不存在依次获取：
String getPrimaryImage(Site site, Item item) {
  String? itemId;
  String? tag;

  tag = item.imageTags?.primary ?? item.parentPrimaryImageTag ?? item.seriesPrimaryImageTag;
  if (tag == null) {
    return '';
  }

  itemId = item.imageTags?.primary != null
      ? item.id
      : item.parentPrimaryImageTag != null
      ? item.parentId
      : item.seriesId;

  return getImageUrl(site, itemId!, ImageProps(tag: tag, type: ImageType.primary, quality: 90));
}



String getBackdropImage(Site site, Item item) {
  String? itemId;
  String? tag;

  if (item.backdropImageTags?.isNotEmpty == true) {
    itemId = item.id;
    tag = item.backdropImageTags?.first;
  } else if (item.parentBackdropImageTags?.isNotEmpty == true) {
    itemId = item.parentBackdropItemId;
    tag = item.parentBackdropImageTags?.first;
  } else {
    return '';
  }

  return getImageUrl(site, itemId!, ImageProps(tag: tag, type: ImageType.backdrop, quality: 90));
}


String getThumbImage(Site site, Item item) {
  String? itemId;
  String? tag;

  tag = item.imageTags?.thumb ?? item.parentThumbImageTag ?? item.seriesThumbImageTag;
  if (tag == null) {
    return '';
  }

  itemId = item.imageTags?.thumb != null
      ? item.id
      : item.parentThumbImageTag != null
      ? item.parentThumbItemId
      : item.seriesId;

  return getImageUrl(site, itemId!, ImageProps(tag: tag, type: ImageType.thumb, quality: 90));
}


String getLogoImage(Site site, Item item){
  String? itemId;
  String? tag;

  if(item.imageTags?.logo != null){
    itemId = item.id;
    tag = item.imageTags?.logo;
  }else if(item.parentLogoImageTag != null){
    tag = item.parentLogoImageTag!;
    itemId = item.parentLogoItemId;
  }else{
    return '';
  }
  return getImageUrl(site, itemId!, ImageProps(tag: tag, type: ImageType.logo, quality: 90));
}

String getBannerImage(Site site, Item item){
  String? itemId;
  String? tag;

  if(item.imageTags?.banner != null){
    itemId = item.id;
    tag = item.imageTags?.banner;
  }else{
    return '';
  }
  return getImageUrl(site, itemId!, ImageProps(tag: tag, type: ImageType.banner, quality: 90));
}