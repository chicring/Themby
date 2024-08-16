
class FvpState {

  String? mediaId;

  String? parentId;

  String? currentMediaId;

  String? mediaSourceId;

  String? playSessionId;

  String? mediaType;

  double rate = 1.0;

  Duration? position;

  int? textureId;

  FvpState({
    this.mediaId,
    this.parentId,
    this.currentMediaId,
    this.mediaSourceId,
    this.playSessionId,
    this.mediaType,
    this.rate = 1.0,
    this.position,
    this.textureId,
  });

  FvpState copyWith({
    String? mediaId,
    String? parentId,
    String? currentMediaId,
    String? mediaSourceId,
    String? playSessionId,
    String? mediaType,
    double? rate,
    Duration? position,
    int? textureId,
  }) {
    return FvpState(
      mediaId: mediaId ?? this.mediaId,
      parentId: parentId ?? this.parentId,
      currentMediaId: currentMediaId ?? this.currentMediaId,
      mediaSourceId: mediaSourceId ?? this.mediaSourceId,
      playSessionId: playSessionId ?? this.playSessionId,
      mediaType: mediaType ?? this.mediaType,
      rate: rate ?? this.rate,
      position: position ?? this.position,
      textureId: textureId ?? this.textureId,
    );
  }
}