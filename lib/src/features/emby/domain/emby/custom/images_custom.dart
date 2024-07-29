
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/application/image_service.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';

class ImagesCustom{
  String primary;
  String backdrop;
  String logo;
  String thumb;
  String banner;

  ImagesCustom({
    required this.primary,
    required this.backdrop,
    required this.logo,
    required this.thumb,
    required this.banner,
  });

  factory ImagesCustom.builder(Item item, Site site){
    {
      return ImagesCustom(
          primary: getPrimaryImage(site, item),
          backdrop: getBackdropImage(site, item),
          logo: getLogoImage(site, item),
          thumb: getThumbImage(site, item),
          banner: getBannerImage(site, item)
      );
    }
  }
}