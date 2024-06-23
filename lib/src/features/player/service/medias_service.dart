import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/emby/domain/episode.dart';
import 'package:themby/src/features/emby/domain/media_detail.dart';
import 'package:themby/src/features/player/domain/medias_state.dart';

part 'medias_service.g.dart';

@riverpod
class MediasService extends _$MediasService {

  @override
  MediasState build() => MediasState();


  Future<void> setPlayUrlByOne(MediaDetail detail) async {
    final playbackInfo = await ref.read(getPlaybackInfoProvider(detail.id).future);
    final url = await ref.read(playUrlProvider(playbackInfo.mediaSources).future);
    state.currentPlayUrl = url;
    state.playingTitle = detail.name;
    state.detail = detail;
  }

  Future<void> setPlayUrlByMany(List<Episode> episodes, int index) async{
    final playbackInfo = await ref.read(getPlaybackInfoProvider(episodes[index].id).future);
    final url = await ref.read(playUrlProvider(playbackInfo.mediaSources).future);
    state.currentPlayUrl = url;
    state.playingTitle = episodes[index].name;
    state.playingIndex = index;
    state.episodes = episodes;
  }

}