
import 'dart:async';

import 'package:flutter/material.dart';


const List<Map<String, dynamic>> videoFitType = [
  {'attr': BoxFit.contain, 'desc': '包含'},
  {'attr': BoxFit.cover, 'desc': '覆盖'},
  {'attr': BoxFit.fill, 'desc': '填充'},
  {'attr': BoxFit.fitHeight, 'desc': '高度适应'},
  {'attr': BoxFit.fitWidth, 'desc': '宽度适应'},
  {'attr': BoxFit.scaleDown, 'desc': '缩小适应'},
];


class ControlsState {

  Timer? timer;

  String mediaId = '0';

  bool isPlaying = false;

  double rate = 1.0;

  //控制器锁
  bool controlsLock = false;

  //视频方向
  bool horizontal = false;

  //控制器显示
  bool showControls = true;

  bool isLongPressMultiple = false;

  //填充方式
  int fitType = 0;

  //播放位置时间
  Duration position = const Duration();

  ControlsState({
    this.mediaId = '0',
    this.isPlaying = false,
    this.controlsLock = false,
    this.fitType = 0,
    this.horizontal = false,
    this.showControls = true,
    this.position = const Duration(),
    this.rate = 1.0,
    this.isLongPressMultiple = false,
  });

  ControlsState copyWith({
    String? mediaId,
    bool? controlsLock,
    bool? horizontal,
    bool? showControls,
    int? fitType,
    bool? isPlaying,
    Duration? position,
    double? rate,
    bool? isLongPressMultiple,
  }) {
    return ControlsState(
      mediaId: mediaId ?? this.mediaId,
      controlsLock: controlsLock ?? this.controlsLock,
      fitType: fitType ?? this.fitType,
      horizontal: horizontal ?? this.horizontal,
      showControls: showControls ?? this.showControls,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      rate: rate ?? this.rate,
      isLongPressMultiple: isLongPressMultiple ?? this.isLongPressMultiple,
    );
  }
}