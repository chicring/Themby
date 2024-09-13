

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/emby/item.dart';
import 'package:themby/src/features/emby/domain/playback_info.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/constants.dart';
import 'package:themby/src/features/player/domain/controls_state.dart';
import 'package:themby/src/features/player/service/themby_controller.dart';

part 'controls_service.g.dart';


@riverpod
class ControlsService extends _$ControlsService{

  @override
  ControlsState build() => ControlsState(position: Duration.zero);

  ///首次开始播放
  Future<void> startPlay(SelectedMedia media) async{

    late String currentId;
    late String url;
    late String mediaSourceId;
    late String playSessionId;

    if(media.type == 'Movie'){
      PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(media.id!).future);
      mediaSourceId = playInfo.mediaSources[media.mediaSourcesIndex ?? 0].id;
      playSessionId = playInfo.playSessionId;
      url = await ref.read(getPlayerUrlProvider(media.id!,index: media.mediaSourcesIndex).future);
      currentId = media.id!;
    }else if(media.type == "Series"){
      await ref.read(getNextUpProvider(media.id!).future)
          .then((value) {
        currentId = value[0].id!;
      });
      PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(currentId).future);
      mediaSourceId = playInfo.mediaSources[media.mediaSourcesIndex ?? 0].id;
      playSessionId = playInfo.playSessionId;
      url = await ref.read(getPlayerUrlProvider(currentId,index: media.mediaSourcesIndex).future);
    }else if(media.type == "Episode"){
      PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(media.id!).future);
      mediaSourceId = playInfo.mediaSources[media.mediaSourcesIndex ?? 0].id;
      playSessionId = playInfo.playSessionId;
      url = await ref.read(getPlayerUrlProvider(media.id!,index: media.mediaSourcesIndex).future);
      currentId = media.id!;
    }
    state = state.copyWith(
        mediaId: media.id,
        parentId: media.parentId,
        currentMediaId: currentId,
        mediaSourceId: mediaSourceId,
        playSessionId: playSessionId,
        playType: media.type,
        mediaIndex: media.playIndex,
        position: media.position
    );

    await ref.read(videoControllerProvider)
        .player
        .open(Media(url,httpHeaders: {'user-agent': "Themby/1.0.4",},start: media.position));

    await ref.read(videoControllerProvider).player.play().then((v)async{
      if(media.audioIndex != null){
        toggleAudio(media.audioIndex!);
      }
      if(media.subtitleIndex != null){
        toggleSubtitle(media.subtitleIndex!);
      }
    });
  }

  ///跳转到指定位置
  Future<void> seekTo(Duration position,{String type = "slide"}) async{
    if (position < Duration.zero) {
      position = Duration.zero;
    }
    if(type != "slide"){
      await ref.read(videoControllerProvider).player.stream.buffer.first;
    }

    await ref.read(videoControllerProvider).player.seek(position);

    if (!ref.read(videoControllerProvider).player.state.playing) {
      ref.read(videoControllerProvider).player.play();
    }
  }

  ///设置播放速度
  Future<void> setRate(double rate) async{
    ref.read(videoControllerProvider).player.setRate(rate);
    state = state.copyWith(rate: rate);
  }

  /// 切换到指定的媒体
  Future<void> togglePlayMedia(String id, int index) async {
    ref.read(videoControllerProvider).player.pause();

    PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(id).future);
    String mediaSourceId = playInfo.mediaSources[0].id;
    String playSessionId = playInfo.playSessionId;
    String url = await ref.read(getPlayerUrlProvider(id).future);

    ref.read(videoControllerProvider).player.open(Media(url,httpHeaders: {'user-agent': "Themby/1.0.3",}));
    ref.read(videoControllerProvider).player.play().then((v) {
      startRecordPosition();
    });
    state = state.copyWith(currentMediaId: id, mediaSourceId: mediaSourceId, playSessionId: playSessionId, mediaIndex: index);
  }

  /// 切换音轨
  Future<void> toggleAudio(int index) async {
    final player = ref.read(videoControllerProvider).player;
    List<AudioTrack> audios = player.state.tracks.audio;

    await ref.read(videoControllerProvider).player.stream.buffer.first;

    await player.setAudioTrack(audios[index + 2]);
  }

  /// 切换字幕
  Future<void> toggleSubtitle(int index) async {
    final player = ref.read(videoControllerProvider).player;
    List<SubtitleTrack> subtitles = player.state.tracks.subtitle;

    await ref.read(videoControllerProvider).player.stream.buffer.first;
    await player.setSubtitleTrack(subtitles[index + 2]);
  }

  /// 播放下一集
  Future<void> playNext() async {
    ref.read(controlsServiceProvider.notifier).clearPosition();
    if(state.playType == "Movie"){
      SmartDialog.showToast('没有下一集了');
      return;
    }
    SmartDialog.show(
        tag: TagsString.nextLoading,
        clickMaskDismiss: false,
        builder: (_) {
          return Image.asset("assets/loading/loading-2.gif",height: 50);
        }
    );
    if(state.playType == "Episode"){

      await ref.watch(getEpisodesProvider(state.parentId!,state.parentId!).future)
          .then((items) async{
        final String nextId = _findNextOrPreviousMediaId(items,state.currentMediaId!, "next");
        if(nextId.isEmpty){
          SmartDialog.showToast('没有下一集了');
          SmartDialog.dismiss(tag: TagsString.nextLoading);
          return;
        }
        await togglePlayMedia(nextId, state.mediaIndex! + 1);
      });
    }else if(state.playType == 'Series'){
      await ref.watch(getNextUpProvider(state.mediaId!).future)
          .then((items) async{
        final String nextId = _findNextOrPreviousMediaId(items,state.currentMediaId!, "next");
        if(nextId.isEmpty){
          SmartDialog.showToast('没有下一集了');
          SmartDialog.dismiss(tag: TagsString.nextLoading);
          return;
        }
        await togglePlayMedia(nextId, state.mediaIndex! + 1);
      });
    }
    SmartDialog.dismiss(tag: TagsString.nextLoading);
  }

  Future<void> playPrevious() async {
    ref.read(controlsServiceProvider.notifier).clearPosition();
    if(state.playType == "Movie"){
      SmartDialog.showToast('没有上一集了');
      return;
    }
    SmartDialog.show(
        tag: TagsString.nextLoading,
        clickMaskDismiss: false,
        builder: (_) {
          return Image.asset("assets/loading/loading-2.gif",height: 50);
        }
    );
    if(state.playType == "Episode"){

      await ref.watch(getEpisodesProvider(state.parentId!,state.parentId!).future)
          .then((items) async{
        final String previousId = _findNextOrPreviousMediaId(items,state.currentMediaId!, "");
        if(previousId.isEmpty){
          SmartDialog.showToast('没有上一集了');
          SmartDialog.dismiss(tag: TagsString.nextLoading);
          return;
        }
        await togglePlayMedia(previousId, state.mediaIndex! - 1);
      });
    }else if(state.playType == 'Series'){
      await ref.watch(getNextUpProvider(state.mediaId!).future)
          .then((items) async{
        final String previousId = _findNextOrPreviousMediaId(items,state.currentMediaId!, "");
        if(previousId.isEmpty){
          SmartDialog.showToast('没有上一集了');
          SmartDialog.dismiss(tag: TagsString.nextLoading);
          return;
        }
        await togglePlayMedia(previousId, state.mediaIndex! - 1);
      });
    }
    SmartDialog.dismiss(tag: TagsString.nextLoading);
  }


  String _findNextOrPreviousMediaId(List<Item> items, String mediaId, String type){
    if (items.isEmpty) {
      return '';
    }
    for(int i = 0; i < items.length; i++){
      if(items[i].id == mediaId){
        if(i == 0 && type == "") {
          return '';
        }else if(i == items.length -1){
          return '';
        }
        if(type == "next"){
          return items[i+1].id ?? '';
        }else{
          return items[i-1].id ?? '';
        }
      }
    }
    return '';
  }

  /// 开始记录播放位置
  Future<void> startRecordPosition({int? position}) async {
    final mediaId = state.mediaId;
    final mediaSourceId = state.mediaSourceId;
    final playSessionId = state.playSessionId;
    await ref.read(positionStartProvider(mediaId!, position ?? 0, playSessionId!, mediaSourceId!).future);
  }

  /// 记录播放位置
  Future<void> recordPosition({String type = "update"}) async {
    final player = ref.read(videoControllerProvider).player;

    if (player.state.playing == false) {
      return;
    }

    final position = player.state.position;
    final mediaId = state.mediaId;
    final mediaSourceId = state.mediaSourceId;
    final playSessionId = state.playSessionId;

    if (type == "update") {
      ref.read(positionBackProvider(mediaId!, position.inMicroseconds * 10, playSessionId!, mediaSourceId!));
    } else {
      ref.read(positionStopProvider(mediaId!, position.inMicroseconds * 10, playSessionId!, mediaSourceId!));
    }
  }

  /// 清除播放位置
  void clearPosition() {
    state = state.copyWith(position: Duration.zero);
  }

}