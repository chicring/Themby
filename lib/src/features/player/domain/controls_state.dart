
import 'dart:async';

class ControlsState {

  Timer? timer;

  bool isPlaying = false;

  double rate = 1.0;


  //控制器锁
  bool controlsLock = false;

  //视频方向
  bool horizontal = false;

  //控制器显示
  bool showControls = true;

  //填充方式
  int fitType = 0;

  //播放位置时间
  Duration position = const Duration();

  ControlsState({
    this.isPlaying = false,
    this.controlsLock = false,
    this.fitType = 0,
    this.horizontal = false,
    this.showControls = true,
    this.position = const Duration(),
  });

  ControlsState copyWith({
    bool? controlsLock,
    bool? horizontal,
    bool? showControls,
    int? fitType,
    bool? isPlaying,
    Duration? position,
  }) {
    return ControlsState(
      controlsLock: controlsLock ?? this.controlsLock,
      fitType: fitType ?? this.fitType,
      horizontal: horizontal ?? this.horizontal,
      showControls: showControls ?? this.showControls,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
    );
  }
}