import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/domiani/play_info.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';


/// 获取视频播放信息
PlayInfo getPlayInfo(MediaDetail detail) {

  final int duration = detail.userData.playbackPositionTicks ?? 0;

  return PlayInfo(
    id: detail.id,
    type: detail.type,
    index: detail.indexNumber,
    duration:  Duration(milliseconds: duration ~/ 10000),
  );
}

