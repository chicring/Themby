
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class ControlsState {
  late Player playboy;

  late final VideoController controller;


  bool controlsLock = false;

  bool bottomShow = true;

  bool topShow = true;

  //播放位置时间
  Duration position = const Duration(seconds: 0);

  //视频时长
  Duration duration = const Duration(seconds: 0);

  //视频方向
  String direction = 'horizontal';

  //填充方式
  int fitType = 0;

  ControlsState.internal(){
    playboy = Player(
        configuration: const PlayerConfiguration(
        )
    );
    controller = VideoController(
      playboy,
      configuration: const VideoControllerConfiguration(
        enableHardwareAcceleration: true,
      ),
    );
  }

  ControlsState({
    required this.playboy,
    required this.controller,
    this.controlsLock = false,
    this.bottomShow = true,
    this.topShow = true,
    this.position = const Duration(seconds: 0),
    this.duration = const Duration(seconds: 0),
    this.direction = 'horizontal',
    this.fitType = 0,
  });

  ControlsState copyWith({
    Player? playboy,
    VideoController? controller,
    bool? controlsLock,
    bool? bottomShow,
    bool? topShow,
    Duration? position,
    Duration? duration,
    String? direction,
    int? fitType,
  }) {
    return ControlsState(
      playboy: playboy ?? this.playboy,
      controller: controller ?? this.controller,
      controlsLock: controlsLock ?? this.controlsLock,
      bottomShow: bottomShow ?? this.bottomShow,
      topShow: topShow ?? this.topShow,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      direction: direction ?? this.direction,
      fitType: fitType ?? this.fitType,
    );
  }
}