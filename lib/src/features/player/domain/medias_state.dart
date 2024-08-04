

import 'package:themby/src/features/emby/domain/episode.dart';

import 'package:themby/src/features/emby/domain/playback_info.dart';

class MediasState {

  final List<MediaSource> sources;

  final List<Episode> episodes;

  // 视频序号
  int playingIndex = 0;

  MediasState({
    this.episodes = const [],
    this.sources = const [],
    this.playingIndex = 0
  });

  MediasState copyWith({
    List<MediaSource>? sources,
    List<Episode>? episodes,
    int? playingIndex,
  }) {
    return MediasState(
      episodes: episodes ?? this.episodes,
      playingIndex: playingIndex ?? this.playingIndex,
      sources: sources ?? this.sources,
    );
  }
}