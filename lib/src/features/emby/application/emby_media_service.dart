import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';

part 'emby_media_service.g.dart';

@riverpod
class EmbyMediaService extends _$EmbyMediaService{

  @override
  SelectedMedia build() => SelectedMedia();

  SelectedMedia getSelectedMedia(Item item){

    final int duration = item.userData?.playbackPositionTicks ?? 0;

    return SelectedMedia(
      id: item.id,
      parentId: item.seasonId,
      type: item.type,
      position: Duration(milliseconds: duration ~/ 10000),
      playIndex: item.indexNumber ?? 1,
      mediaSourcesIndex: state.mediaSourcesIndex,
      subtitleIndex: state.subtitleIndex,
      audioIndex: state.audioIndex,
    );
  }

  void setMediaSourcesIndex(int index){
    state = state.copyWith(mediaSourcesIndex: index, subtitleIndex: null, audioIndex: null);
  }

  void setSubtitleIndex(int index){
    state = state.copyWith(subtitleIndex: index);
  }

  void setAudioIndex(int index){
    state = state.copyWith(audioIndex: index);
  }

  void setPlayIndex(int index){
    state = state.copyWith(playIndex: index);
  }

  void setPosition(Duration position){
    state = state.copyWith(position: position);
  }

  void setId(String id){
    state = state.copyWith(id: id);
  }

  void setType(String type){
    state = state.copyWith(type: type);
  }
}