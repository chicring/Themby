

class ControlsState {

  String? mediaId;

  String? parentId;

  String? currentMediaId;

  String? mediaSourceId;

  String? playSessionId;

  String? playType;

  int? mediaIndex;

  double rate = 1.0;

  Duration position;


  ControlsState({
    this.mediaId,
    this.parentId,
    this.currentMediaId,
    this.mediaSourceId,
    this.playSessionId,
    this.playType,
    this.mediaIndex,
    this.rate = 1.0,
    required this.position,
  });

  ControlsState copyWith({
    String? mediaId,
    String? parentId,
    String? currentMediaId,
    String? mediaSourceId,
    String? playSessionId,
    String? playType,
    int? mediaIndex,
    double? rate,
    Duration? position,
  }) {
    return ControlsState(
      mediaId: mediaId ?? this.mediaId,
      parentId: parentId ?? this.parentId,
      currentMediaId: currentMediaId ?? this.currentMediaId,
      mediaSourceId: mediaSourceId ?? this.mediaSourceId,
      playSessionId: playSessionId ?? this.playSessionId,
      playType: playType ?? this.playType,
      mediaIndex: mediaIndex ?? this.mediaIndex,
      rate: rate ?? this.rate,
      position: position ?? this.position,
    );
  }
}