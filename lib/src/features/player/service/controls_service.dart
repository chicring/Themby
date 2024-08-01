

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/common/domiani/play_info.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/emby/data/view_repository.dart';
import 'package:themby/src/features/emby/domain/playback_info.dart';
import 'package:themby/src/features/emby/domain/selected_media.dart';
import 'package:themby/src/features/player/domain/controls_state.dart';
import 'package:themby/src/features/player/service/medias_service.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/control_toast.dart';

part 'controls_service.g.dart';


@riverpod
class ControlsService extends _$ControlsService{

  @override
  ControlsState build() => ControlsState();

  ///首次开始播放
  Future<void> startPlay(SelectedMedia media) async{

    late String url;
    late String mediaSourceId;
    late String playSessionId;

    if(media.type == 'Movie'){
      PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(media.id!).future);
      mediaSourceId = playInfo.mediaSources[0].id;
      playSessionId = playInfo.playSessionId;
      url = await ref.read(getPlayerUrlProvider(media.id!).future);
    }
      ref.read(videoControllerProvider).player.open(Media(url));
      ref.read(videoControllerProvider).player.play();

    if(media.position != null){
      seekTo(media.position!);
    }

    state = state.copyWith(mediaId: media.id, mediaSourceId: mediaSourceId, playSessionId: playSessionId);
  }

  ///跳转到指定位置
  Future<void> seekTo(Duration position) async{
    if (position < Duration.zero) {
      position = Duration.zero;
    }
    await ref.read(videoControllerProvider).player.stream.buffer.first;

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

  ///锁定控制器
  void lockControls(){
    state = state.copyWith(controlsLock: true);
  }

  ///解锁控制器
  void unlockControls(){
    state = state.copyWith(controlsLock: false, showControls: true);
  }

  ///显示控制器
  void showControls(){
    state.copyWith(showControls: true);
  }

  ///隐藏控制器
  void hideControls(){
    state.copyWith(showControls: false);
  }

  // Future<void> startPlay(PlayInfo info) async {
  //
  //   String requestId = info.id;
  //
  //   if (info.type == 'Series') {
  //     await ref.read(getNextUpProvider(info.id).future)
  //         .then((value) {
  //           requestId = value.items[0].id!;
  //       });
  //   }
  //
  //   PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(requestId).future);
  //
  //   String mediaSourceId = playInfo.mediaSources[0].id;
  //   String playSessionId = playInfo.playSessionId;
  //   String url = await ref.read(getPlayerUrlProvider(requestId).future);
  //
  //   ref.read(videoControllerProvider).player.open(Media(url));
  //   ref.read(videoControllerProvider).player.play();
  //
  //   seekTo(info.duration);
  //
  //   if(info.type == 'Episode') {
  //     final media = await ref.read(GetMediaProvider(info.id).future);
  //     // final episodes = await ref.read(getEpisodesProvider(media.parentId,media.parentId).future);
  //     // ref.read(mediasServiceProvider.notifier).setEpisode(episodes);
  //   } else if(info.type == 'Series') {
  //     await ref.read(getNextUpProvider(info.id).future);
  //     final episodes = await ref.read(getEpisodesProvider(info.id,info.id).future);
  //     // ref.read(mediasServiceProvider.notifier).setEpisode(episodes);
  //   }
  //
  //   state = state.copyWith(mediaId: info.id, mediaSourceId: mediaSourceId, playSessionId: playSessionId);
  //
  //   /// 记录播放位置
  //   startRecordPosition(position: info.duration.inMicroseconds * 10);
  //   backTimer = Timer.periodic(const Duration(seconds: 15), (timer) {
  //     recordPosition();
  //   });
  //
  //   autoHideControls();
  // }
  //
  // Future<void> togglePlayMedia(String id) async {
  //   state = state.copyWith(mediaId: id);
  //   ref.read(videoControllerProvider).player.stop();
  //
  //   PlaybackInfo playInfo = await ref.read(getPlaybackInfoProvider(id).future);
  //   String mediaSourceId = playInfo.mediaSources[0].id;
  //   String playSessionId = playInfo.playSessionId;
  //   String url = await ref.read(getPlayerUrlProvider(id).future);
  //
  //   state = state.copyWith(mediaId: id, mediaSourceId: mediaSourceId, playSessionId: playSessionId);
  //
  //   ref.read(videoControllerProvider).player.open(Media(url));
  //   ref.read(videoControllerProvider).player.play();
  //
  //   startRecordPosition();
  //
  //   SmartDialog.dismiss();
  // }
  //
  // Future<void> toggleAudio(int index) async {
  //   final player = ref.read(videoControllerProvider).player;
  //   List<AudioTrack> audios = player.state.tracks.audio;
  //
  //   await ref.read(videoControllerProvider).player.stream.buffer.first;
  //
  //   await player.setAudioTrack(audios[index + 2]);
  //   // if(audios.isEmpty){
  //   //   SmartDialog.showToast('没有音轨');
  //   //   return;
  //   // }
  //   // for (AudioTrack audio in audios) {
  //   //   SmartDialog.showToast('${audio.title} |  ${audio.language}');
  //   // }
  //   SmartDialog.dismiss();
  // }
  //
  // Future<void> toggleSubtitle(int index) async {
  //   final player = ref.read(videoControllerProvider).player;
  //   List<SubtitleTrack> subtitles = player.state.tracks.subtitle;
  //
  //   await ref.read(videoControllerProvider).player.stream.buffer.first;
  //   await player.setSubtitleTrack(subtitles[index + 2]);
  //   SmartDialog.dismiss();
  //
  // }
  //
  //
  // Future<void> playNext() async {
  //   final episodes = ref.read(mediasServiceProvider);
  //   if(episodes.isEmpty){
  //     SmartDialog.showToast('没有下一集了');
  //     return;
  //   }
  // }
  //
  // Future startRecordPosition({int? position}) async {
  //   final mediaId = state.mediaId;
  //   final mediaSourceId = state.mediaSourceId;
  //   final playSessionId = state.playSessionId;
  //   await ref.read(positionStartProvider(mediaId, position ?? 0, playSessionId, mediaSourceId).future);
  // }
  //
  // //记录播放位置
  // Future recordPosition({String type = "update"}) async {
  //   final player = ref.read(videoControllerProvider).player;
  //
  //   if (player.state.playing == false) {
  //     return;
  //   }
  //
  //   final position = player.state.position;
  //   final mediaId = state.mediaId;
  //   final mediaSourceId = state.mediaSourceId;
  //   final playSessionId = state.playSessionId;
  //
  //   if (type == "update") {
  //     await ref.read(positionBackProvider(mediaId, position.inMicroseconds * 10, playSessionId, mediaSourceId).future);
  //   } else {
  //     await ref.read(positionStopProvider(mediaId, position.inMicroseconds * 10, playSessionId, mediaSourceId).future);
  //   }
  // }
  //
  //
  // void cancelAutoHideControls() {
  //   state.timer?.cancel();
  // }
  //
  // void autoHideControls() {
  //   cancelAutoHideControls();
  //   state.timer = Timer(const Duration(seconds: 5), () {
  //     if (state.showControls) {
  //       state = state.copyWith(showControls: false);
  //     }
  //   });
  // }
  //
  // void lockOrUnlock() {
  //   state = state.copyWith(controlsLock: !state.controlsLock);
  // }
  //
  // //显示或者隐藏控制器
  // Future<void> showOrHide() async {
  //   if (state.showControls) {
  //     cancelAutoHideControls();
  //     state = state.copyWith(showControls: false);
  //   } else {
  //     state = state.copyWith(showControls: true);
  //     autoHideControls();
  //   }
  // }
  //
  // //双击暂停或者开始
  // Future<void> onDoubleTapCenter() async{
  //   ref.read(videoControllerProvider).player.playOrPause();
  //   autoHideControls();
  // }
  //
  // Future<void> onDoubleTapLeft() async{
  //   SmartDialog.dismiss();
  //   final position = ref.read(videoControllerProvider).player.state.position;
  //
  //   ref.read(videoControllerProvider).player.seek(position - const Duration(seconds: 10));
  //
  //   SmartDialog.showToast(
  //     '',
  //     alignment: Alignment.topCenter,
  //     displayTime: const Duration(milliseconds: 800),
  //     displayType: SmartToastType.last,
  //     builder: (context) {
  //       return textToast('快退10秒');
  //     }
  //   );
  //   autoHideControls();
  // }
  //
  // Future<void> onDoubleTapRight() async{
  //   SmartDialog.dismiss();
  //
  //   final position = ref.read(videoControllerProvider).player.state.position;
  //
  //   ref.read(videoControllerProvider).player.seek(position + const Duration(seconds: 10));
  //   SmartDialog.showToast(
  //       '',
  //       alignment: Alignment.topCenter,
  //       displayTime: const Duration(milliseconds: 800),
  //       displayType: SmartToastType.last,
  //       builder: (context) {
  //         return textToast('快进10秒');
  //       }
  //   );
  //   autoHideControls();
  // }
  //
  // //拖动进度条
  // Future<void> seekTo(Duration position) async{
  //   if (position < Duration.zero) {
  //     position = Duration.zero;
  //   }
  //   await ref.read(videoControllerProvider).player.stream.buffer.first;
  //
  //   await ref.read(videoControllerProvider).player.seek(position);
  //
  //   if (!ref.read(videoControllerProvider).player.state.playing) {
  //     ref.read(videoControllerProvider).player.play();
  //   }
  //   autoHideControls();
  // }
  //
  // //设置播放速度
  // Future<void> setRate(double rate) async{
  //   ref.read(videoControllerProvider).player.setRate(rate);
  //   state = state.copyWith(rate: rate);
  //   autoHideControls();
  // }
  //
  // void showOrHideSpeedToast(){
  //   state = state.copyWith(isLongPressMultiple: !state.isLongPressMultiple);
  // }
  // //长按改变播放速度
  // Future<void> longPressSpeed() async{
  //   SmartDialog.show(
  //       alignment: Alignment.topCenter,
  //       maskColor: Colors.transparent,
  //       builder: (context) {
  //         return iconToast('${state.rate * 2}倍速快进中', Icons.fast_forward_rounded);
  //       }
  //   );
  //   double rate = ref.read(videoControllerProvider).player.state.rate;
  //   ref.read(videoControllerProvider).player.setRate(rate * 2);
  // }
  //
  //
  // // void toggleFitType() {
  // //   final length = videoFitType.length;
  // //   int fitType = state.fitType;
  // //   if (state.fitType == length - 1) {
  // //     fitType = 0;
  // //   } else {
  // //     fitType = state.fitType + 1;
  // //   }
  // //   print('fitType: $fitType');
  // //   state = state.copyWith(fitType: fitType);
  // // }
  //
  //
  // //销毁
  // Future<void> dispose() async {
  //   backTimer?.cancel();
  //   state.timer?.cancel();
  //
  //   ref.read(videoControllerProvider).player.stop();
  //
  //   await recordPosition(type: "stop").then((v) {
  //     ref.refresh(GetMediaProvider(state.mediaId));
  //   });
  //
  //   // await ref.read(videoControllerProvider).player.dispose();
  //   ref.read(mediasServiceProvider.notifier).removeEpisode();
  //
  //   state = state.copyWith(mediaId: '0', mediaSourceId: '', playSessionId: '',timer: null, backTimer: null);
  //
  // }
  //
  // void showSetSpeedSheet(){
  //   final double currentSpeed = state.rate;
  //   final List<double> speedsList = [
  //     0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.5, 3.0
  //   ];
  //
  //   SmartDialog.show(
  //     alignment: Alignment.centerRight,
  //       maskColor: Colors.transparent,
  //     builder: (context) {
  //       return Container(
  //         width: 220,
  //         color: Colors.black.withOpacity(0.85),
  //         child: SingleChildScrollView(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               for (var speed in speedsList)
  //                 TextButton(
  //                   child: Text(
  //                     speed.toString(),
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       color: speed == currentSpeed ? Colors.white : Colors.grey,
  //                     ),
  //                   ),
  //                   onPressed: () {
  //                     setRate(speed);
  //                     SmartDialog.dismiss();
  //                   },
  //                 ),
  //             ],
  //           ),
  //         )
  //       );
  //     }
  //   );
  // }

}