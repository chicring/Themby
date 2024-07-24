
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

  //回传计时器
  Timer? backTimer;

  String mediaId = '0';

  String mediaSourceId = '';

  String playSessionId = '';

  double rate = 1.0;

  //控制器锁
  bool controlsLock = false;

  //控制器显示
  bool showControls = true;

  bool isLongPressMultiple = false;

  //填充方式
  int fitType = 0;

  ControlsState({
    this.timer,
    this.backTimer,
    this.mediaId = '0',
    this.mediaSourceId = '',
    this.playSessionId = '',
    this.controlsLock = false,
    this.fitType = 0,
    this.showControls = true,
    this.rate = 1.0,
    this.isLongPressMultiple = false,
  });

  ControlsState copyWith({
    Timer? timer,
    Timer? backTimer,
    String? mediaId,
    String? mediaSourceId,
    String? playSessionId,
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
      timer: timer ?? this.timer,
      backTimer: backTimer ?? this.backTimer,
      mediaId: mediaId ?? this.mediaId,
      mediaSourceId: mediaSourceId ?? this.mediaSourceId,
      playSessionId: playSessionId ?? this.playSessionId,
      controlsLock: controlsLock ?? this.controlsLock,
      fitType: fitType ?? this.fitType,
      showControls: showControls ?? this.showControls,
      rate: rate ?? this.rate,
      isLongPressMultiple: isLongPressMultiple ?? this.isLongPressMultiple,
    );
  }
}