import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:themby/src/common/domiani/play_info.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/media.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';


/// 获取视频播放信息
PlayInfo getPlayInfo(Item item) {

  final int duration = item.userData?.playbackPositionTicks ?? 0;

  return PlayInfo(
    id: item.id!,
    type: item.type!,
    index: item.indexNumber ?? 0,
    duration:  Duration(milliseconds: duration ~/ 10000),
  );
}

/// 获取视频播放信息
PlayInfo getPlayInfoByMedia(Media media) {
  final int duration = media.userData.playbackPositionTicks ?? 0;

  return PlayInfo(
    id: media.id,
    type: media.type,
    index: media.indexNumber,
    duration:  Duration(milliseconds: duration ~/ 10000),
  );
}


/// Duration 转换成 HH:mm:ss 格式
String durationToTime(Duration duration) {
  final int hours = duration.inHours;
  final int minutes = duration.inMinutes.remainder(60);
  final int seconds = duration.inSeconds.remainder(60);

  return '${hours > 0 ? '${hours.toString().padLeft(2, '0')}:' : ''}${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}


/// tick 转换成 HH h mm m 格式
String tickToTime(int ticks) {
  final int duration = ticks ~/ 10000000;
  final int hours = duration ~/ 3600;
  final int minutes = (duration % 3600) ~/ 60;

  return '${hours > 0 ? '$hours' 'h ' : ''}$minutes''m';
}

/// tick 转换成 HH h mm m s 格式
String tickToTimeWithSeconds(int ticks) {
  final int duration = ticks ~/ 10000000;
  final int hours = duration ~/ 3600;
  final int minutes = (duration % 3600) ~/ 60;
  final int seconds = duration % 60;

  return '${hours > 0 ? '$hours' 'h ' : ''}$minutes''m $seconds''s';
}