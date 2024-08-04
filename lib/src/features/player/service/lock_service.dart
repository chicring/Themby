

import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:themby/src/features/player/domain/lock_state.dart';

part 'lock_service.g.dart';

@riverpod
class LockService extends _$LockService {

  Timer? _timer;

  @override
  LockState build () => LockState();

  /// 锁定控制防止误操作
  void toggleLock() {
    state = state.copyWith(controlsLock: !state.controlsLock);
    if (state.controlsLock) {
      state = state.copyWith(showControls: false);
      _timer?.cancel();
    }else{
      toggleShowControl();
    }
  }

  /// 显示控制
  void toggleShowControl() {
    if(state.controlsLock){
      state = state.copyWith(showLockButton: !state.showLockButton);
      return;
    }
    state = state.copyWith(showControls: !state.showControls, showLockButton: !state.showLockButton);

    if (state.showControls) {
      _timer?.cancel();
      _timer = Timer(const Duration(seconds: 5), () {
        state = state.copyWith(showControls: false, showLockButton: false);
      });
    } else {
      _timer?.cancel();
    }
  }
}