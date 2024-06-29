

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/emby/data/play_repository.dart';
import 'package:themby/src/features/player/domain/controls_state.dart';
import 'package:themby/src/features/player/service/video_controller.dart';
import 'package:themby/src/features/player/widget/control_toast.dart';

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

  void lockOrUnlock() {
    state = state.copyWith(controlsLock: !state.controlsLock);
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
    ref.read(videoControllerProvider).player.playOrPause();
    autoHideControls();
  }

  Future<void> onDoubleTapLeft() async{
    SmartDialog.dismiss();
    final position = ref.read(videoControllerProvider).player.state.position;

    ref.read(videoControllerProvider).player.seek(position - const Duration(seconds: 10));

    SmartDialog.showToast(
      '',
      alignment: Alignment.topCenter,
      displayTime: const Duration(milliseconds: 800),
      displayType: SmartToastType.last,
      builder: (context) {
        return textToast('快退10秒');
      }
    );
    autoHideControls();
  }

  Future<void> onDoubleTapRight() async{
    SmartDialog.dismiss();

    final position = ref.read(videoControllerProvider).player.state.position;

    ref.read(videoControllerProvider).player.seek(position + const Duration(seconds: 10));
    SmartDialog.showToast(
        '',
        alignment: Alignment.topCenter,
        displayTime: const Duration(milliseconds: 800),
        displayType: SmartToastType.last,
        builder: (context) {
          return textToast('快进10秒');
        }
    );
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
    state = state.copyWith(rate: rate);
    autoHideControls();
  }

  void showOrHideSpeedToast(){
    state = state.copyWith(isLongPressMultiple: !state.isLongPressMultiple);
  }
  //长按改变播放速度
  Future<void> longPressSpeed() async{
    SmartDialog.show(
        alignment: Alignment.topCenter,
        maskColor: Colors.transparent,
        builder: (context) {
          return iconToast('${state.rate * 2}倍速快进中', Icons.fast_forward_rounded);
        }
    );
    double rate = ref.read(videoControllerProvider).player.state.rate;
    ref.read(videoControllerProvider).player.setRate(rate * 2);
  }

  void toggleFitType() {
    final length = videoFitType.length;
    int fitType = state.fitType;
    if (state.fitType == length - 1) {
      fitType = 0;
    } else {
      fitType = state.fitType + 1;
    }
    print('fitType: $fitType');
    state = state.copyWith(fitType: fitType);
  }


  //销毁
  Future<void> dispose() async {
    ref.read(videoControllerProvider).player.stop();
    ref.read(videoControllerProvider).player.dispose();
  }


  void showSetSpeedSheet(){
    final double currentSpeed = state.rate;
    final List<double> speedsList = [
      0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.5, 3.0
    ];

    SmartDialog.show(
      alignment: Alignment.centerRight,
        maskColor: Colors.transparent,
      builder: (context) {
        return Container(
          width: 220,
          color: Colors.black.withOpacity(0.85),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var speed in speedsList)
                  TextButton(
                    child: Text(
                      speed.toString(),
                      style: TextStyle(
                        fontSize: 16,
                        color: speed == currentSpeed ? Colors.white : Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      setRate(speed);
                      SmartDialog.dismiss();
                    },
                  ),
              ],
            ),
          )
        );
      }
    );
  }

}