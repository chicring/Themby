

import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';

class MediasState{

  //当前播放链接
  late String currentPlayUrl;

  //单个视频
  late MediaDetail detail;

  //季
  late List<Episode> episodes;

  //视频序号
  int playingIndex = 0;

  String playingTitle = '';

}