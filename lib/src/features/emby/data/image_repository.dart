import 'package:themby/src/common/domiani/site.dart';
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

String getAvatarUrl(Site site) {
  return Uri(
    scheme: site.scheme,
    host: site.host,
    port: site.port,
    path: '/emby/Users/${site.userId}/Images/Primary',
    queryParameters: {'tag': site.imageTag},
  ).toString();
}