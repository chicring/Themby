

class SelectedMedia{
  /// item id
  String? id;
  /// 父项目 id
  String? parentId;
  /// item type : movie, series, episode
  String? type;
  /// item position
  Duration? position;
  /// 如果是媒体列表, index是 列表中的index
  int? playIndex;
  /// 视频源 index
  int? mediaSourcesIndex;
  /// 字幕 index
  int? subtitleIndex;
  /// 音频 index
  int? audioIndex;

  SelectedMedia({
    this.id,
    this.parentId,
    this.type,
    this.position,
    this.playIndex,
    this.mediaSourcesIndex,
    this.subtitleIndex,
    this.audioIndex,
  });

  SelectedMedia copyWith({
    String? id,
    String? parentId,
    String? type,
    Duration? position,
    int? playIndex,
    int? mediaSourcesIndex,
    int? subtitleIndex,
    int? audioIndex,
  }){
    return SelectedMedia(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      type: type ?? this.type,
      position: position ?? this.position,
      playIndex: playIndex ?? this.playIndex,
      mediaSourcesIndex: mediaSourcesIndex ?? this.mediaSourcesIndex,
      subtitleIndex: subtitleIndex ?? this.subtitleIndex,
      audioIndex: audioIndex ?? this.audioIndex,
    );
  }
}