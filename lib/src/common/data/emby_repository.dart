import 'package:themby/src/common/domiani/Select.dart';
import 'package:themby/src/features/emby/domain/playback_info.dart';



List<Select> getMediaStreams(List<MediaStream> mediaStreams, String type){
  return mediaStreams
      .where((element) => element.type == type)
      .toList()
      .asMap()
      .entries
      .map((e) => Select(title: e.value.displayTitle, subtitle: e.value.title, value: e.key.toString()))
      .toList();
}