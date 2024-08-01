
import 'dart:async';

import 'package:flutter/material.dart';




class ControlsState {

  String? mediaId;

  String? currentMediaId;

  String? mediaSourceId;

  String? playSessionId;

  double rate = 1.0;

  //控制器锁
  bool controlsLock = false;

  //控制器显示
  bool showControls = true;


  ControlsState({
    this.mediaId,
    this.currentMediaId,
    this.mediaSourceId,
    this.playSessionId,
    this.rate = 1.0,
    this.controlsLock = false,
    this.showControls = true,
  });

  ControlsState copyWith({
    String? mediaId,
    String? currentMediaId,
    String? mediaSourceId,
    String? playSessionId,
    double? rate,
    bool? controlsLock,
    bool? showControls,
  }) {
    return ControlsState(
      mediaId: mediaId ?? this.mediaId,
      currentMediaId: currentMediaId ?? this.currentMediaId,
      mediaSourceId: mediaSourceId ?? this.mediaSourceId,
      playSessionId: playSessionId ?? this.playSessionId,
      rate: rate ?? this.rate,
      controlsLock: controlsLock ?? this.controlsLock,
      showControls: showControls ?? this.showControls,
    );
  }
}