

import 'package:themby/src/common/domiani/Select.dart';
import 'package:themby/src/common/domiani/site.dart';
import 'package:themby/src/features/emby/domain/image_props.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/domain/playback_info.dart';

String getImageByMedia(Site site, Media media, {int quality = 80, ImageType type = ImageType.primary}){

  if(ImageType.primary == type){




  }


  return 'https://image.tmdb.org/t/p/w500';
}



List<Select> getMediaStreams(List<MediaStream> mediaStreams, String type){
  return mediaStreams
      .where((element) => element.type == type)
      .toList()
      .asMap()
      .entries
      .map((e) => Select(title: e.value.displayTitle, subtitle: e.value.title, value: e.key.toString()))
      .toList();
}