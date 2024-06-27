

import 'dart:async';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/player/domain/controls_state.dart';
import 'package:themby/src/features/player/service/video_controller.dart';

part 'controls_service.g.dart';





@riverpod
class ControlsService extends _$ControlsService{

  @override
  ControlsState build() => ControlsState();

  Future<void> startPlay(String id) async {
    final url = await ref.read(getPlayerUrlProvider(id).future);
    if(url.isEmpty){
      SmartDialog.showToast('播放还没有准备好');
      return;
    }
    print('播放链接：'+url);
    ref.read(videoControllerProvider).player.open(Media(url));
    ref.read(videoControllerProvider).player.play();
    autoHideControls();
  }

  void cancelAutoHideControls() {
    state.timer?.cancel();
  }

  void autoHideControls() {
    cancelAutoHideControls();
    state.timer = Timer(const Duration(seconds: 5), () {
      if (state.showControls) {
        state = state.copyWith(showControls: false);
      }
    });
  }

  //显示或者隐藏控制器
  Future<void> showOrHide() async {
    if (state.showControls) {
      cancelAutoHideControls();
      state = state.copyWith(showControls: false);
    } else {
      state = state.copyWith(showControls: true);
      autoHideControls();
    }
  }

  //双击暂停或者开始
  Future<void> onDoubleTapCenter() async{
    // state.controller.player.playOrPause();
    ref.read(videoControllerProvider).player.playOrPause();
    autoHideControls();
  }

  //拖动进度条
  Future<void> seekTo(Duration position) async{
    if (position < Duration.zero) {
      position = Duration.zero;
    }
    ref.read(videoControllerProvider).player.seek(position);
    autoHideControls();
  }

  //设置播放速度
  Future<void> setRate(double rate) async{
    ref.read(videoControllerProvider).player.setRate(rate);
    autoHideControls();
  }

  Future<void> longPressSpeed() async{
    double rate = ref.read(videoControllerProvider).player.state.rate;
    if(rate < 2) {
      ref.read(videoControllerProvider).player.setRate(rate * 2);
    }else{
      ref.read(videoControllerProvider).player.setRate(rate * 1.5);
    }
  }

  //销毁
  Future<void> dispose() async {
    ref.read(videoControllerProvider).player.stop();
    ref.read(videoControllerProvider).player.dispose();
  }

}