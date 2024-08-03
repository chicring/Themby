
import 'dart:async';

import 'package:flutter/material.dart';

class ControlsState {

  String? mediaId;

  String? parentId;

  String? currentMediaId;

  String? mediaSourceId;

  String? playSessionId;

  String? playType;

  double rate = 1.0;

  //控制器锁
  bool controlsLock = false;

  //控制器显示
  bool showControls = true;


  ControlsState({
    this.mediaId,
    this.parentId,
    this.currentMediaId,
    this.mediaSourceId,
    this.playSessionId,
    this.playType,
    this.rate = 1.0,
    this.controlsLock = false,
    this.showControls = true,
  });

  ControlsState copyWith({
    String? mediaId,
    String? parentId,
    String? currentMediaId,
    String? mediaSourceId,
    String? playSessionId,
    String? playType,
    double? rate,
    bool? controlsLock,
    bool? showControls,
  }) {
    return ControlsState(
      mediaId: mediaId ?? this.mediaId,
      parentId: parentId ?? this.parentId,
      currentMediaId: currentMediaId ?? this.currentMediaId,
      mediaSourceId: mediaSourceId ?? this.mediaSourceId,
      playSessionId: playSessionId ?? this.playSessionId,
      playType: playType ?? this.playType,
      rate: rate ?? this.rate,
      controlsLock: controlsLock ?? this.controlsLock,
      showControls: showControls ?? this.showControls,
    );
  }
}