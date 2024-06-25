

import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';

class MediasState {
  // 当前播放链接
  late String currentPlayUrl;

  // 单个视频
  late MediaDetail? detail;

  // 季
  late List<Episode>? episodes;

  // 视频序号
  int playingIndex = 0;

  String playingTitle = '';

  MediasState({
    this.currentPlayUrl = '',
    this.detail,
    this.episodes,
    this.playingIndex = 0,
    this.playingTitle = '',
  });

  MediasState copyWith({
    String? currentPlayUrl,
    MediaDetail? detail,
    List<Episode>? episodes,
    int? playingIndex,
    String? playingTitle,
  }) {
    return MediasState(
      currentPlayUrl: currentPlayUrl ?? this.currentPlayUrl,
      detail: detail ?? this.detail,
      episodes: episodes ?? this.episodes,
      playingIndex: playingIndex ?? this.playingIndex,
      playingTitle: playingTitle ?? this.playingTitle,
    );
  }
}