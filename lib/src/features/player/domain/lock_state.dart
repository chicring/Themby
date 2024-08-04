
class LockState{

  bool showControls;

  bool showLockButton;

  bool controlsLock;

  LockState({
    this.showControls = true,
    this.showLockButton = true,
    this.controlsLock = false,
  });

  LockState copyWith({
    bool? showControls,
    bool? showLockButton,
    bool? controlsLock,
  }) {
    return LockState(
      showControls: showControls ?? this.showControls,
      showLockButton: showLockButton ?? this.showLockButton,
      controlsLock: controlsLock ?? this.controlsLock,
    );
  }
}