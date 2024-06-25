import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/player/domain/medias_state.dart';
import 'package:themby/src/features/player/service/controls_service.dart';

part 'medias_service.g.dart';

@riverpod
class MediasService extends _$MediasService {

  @override
  MediasState build() => MediasState();


  Future<void> setPlayUrlByOne(MediaDetail detail) async {
    // final playbackInfo = await ref.read(getPlaybackInfoProvider(detail.id).future);
    // final url = await ref.read(playUrlProvider(playbackInfo.mediaSources).future);
    //
    // state = state.copyWith(
    //   currentPlayUrl: url,
    //   playingTitle: detail.name,
    //   detail: detail
    // );
    //
    // ref.read(controlsServiceProvider.notifier).startPlay(state.currentPlayUrl);
  }

  Future<void> setPlayUrlByMany(List<Episode> episodes, int index) async{
    // final playbackInfo = await ref.read(getPlaybackInfoProvider(episodes[index].id).future);
    // final url = await ref.read(playUrlProvider(playbackInfo.mediaSources).future);
    //
    // state = state.copyWith(
    //   currentPlayUrl: url,
    //   playingTitle: episodes[index].name,
    //   playingIndex: index,
    //   episodes: episodes
    // );
  }

  Future<void> dispose() async {
    state = state.copyWith(
      currentPlayUrl: '',
      playingTitle: '',
      episodes: [],
      playingIndex: 0
    );
  }

}