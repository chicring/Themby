

import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';

class MediasState {

  late MediaDetail? detail;

  // 季
  late List<Episode>? episodes;

  // 视频序号
  int playingIndex = 0;

  String playingTitle = '';

  MediasState({
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
      detail: detail ?? this.detail,
      episodes: episodes ?? this.episodes,
      playingIndex: playingIndex ?? this.playingIndex,
      playingTitle: playingTitle ?? this.playingTitle,
    );
  }
}