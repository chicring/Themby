
import 'package:themby/common/models/emby_site.dart';
import 'package:themby/common/models/image_props.dart';

class Image {

  static String avatarUrl(EmbySite site) {
    return '${site.host}:${site.port}/emby/Users/${site.userId}/Images/Primary?tag=${site.imageTag}';
  }

  static String imageUrl(EmbySite site, String itemId, ImageProps? imageProps, String? imageTag,[String? type = 'Primary']) {
    if (imageProps == null) {
      return '${site.host}:${site.port}/emby/Items/$itemId/Images/$type?tag=$imageTag&quality=90';
    }else{
      return '${site.host}:${site.port}/emby/Items/$itemId/Images/Primary?'
          'maxHeight=${imageProps.maxHeight}'
          '&maxWidth=${imageProps.maxWidth}'
          '&tag=${imageProps.tag}'
          '&quality=${imageProps.quality}';
    }
  }

}