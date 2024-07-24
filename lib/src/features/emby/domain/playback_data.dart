class PlaybackData {
  int? volumeLevel;
  bool? isMuted;
  bool? isPaused;
  int? playlistLength;
  String? repeatMode;
  int? subtitleOffset;
  int? playbackRate;
  int? playbackStartTimeTicks;
  int? positionTicks;
  int? subtitleStreamIndex;
  int? audioStreamIndex;
  int? maxStreamingBitrate;
  String? playMethod;
  String? playSessionId;
  String? mediaSourceId;
  bool? canSeek;
  String? itemId;
  String? eventName;

  PlaybackData(
      {this.volumeLevel,
        this.isMuted,
        this.isPaused,
        this.repeatMode,
        this.subtitleOffset,
        this.playbackRate,
        this.playbackStartTimeTicks,
        this.positionTicks,
        this.subtitleStreamIndex,
        this.audioStreamIndex,
        this.maxStreamingBitrate,
        this.playMethod,
        this.playSessionId,
        this.mediaSourceId,
        this.canSeek,
        this.itemId,
        this.eventName,
        this.playlistLength
      });

  PlaybackData.fromJson(Map<String, dynamic> json) {
    volumeLevel = json['VolumeLevel'];
    isMuted = json['IsMuted'];
    isPaused = json['IsPaused'];
    repeatMode = json['RepeatMode'];
    subtitleOffset = json['SubtitleOffset'];
    playbackRate = json['PlaybackRate'];
    positionTicks = json['PositionTicks'];
    subtitleStreamIndex = json['SubtitleStreamIndex'];
    audioStreamIndex = json['AudioStreamIndex'];
    playMethod = json['PlayMethod'];
    playSessionId = json['PlaySessionId'];
    mediaSourceId = json['MediaSourceId'];
    canSeek = json['CanSeek'];
    itemId = json['ItemId'];
    eventName = json['EventName'];
    playlistLength = json['PlaylistLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['VolumeLevel'] = volumeLevel;
    data['IsMuted'] = isMuted;
    data['IsPaused'] = isPaused;
    data['RepeatMode'] = repeatMode;
    data['SubtitleOffset'] = subtitleOffset;
    data['PlaybackRate'] = playbackRate;
    data['PlaybackStartTimeTicks'] = playbackStartTimeTicks;
    data['PositionTicks'] = positionTicks;
    data['SubtitleStreamIndex'] = subtitleStreamIndex;
    data['AudioStreamIndex'] = audioStreamIndex;
    data['MaxStreamingBitrate'] = maxStreamingBitrate;
    data['PlayMethod'] = playMethod;
    data['PlaySessionId'] = playSessionId;
    data['MediaSourceId'] = mediaSourceId;
    data['CanSeek'] = canSeek;
    data['ItemId'] = itemId;
    data['EventName'] = eventName;
    data['PlaylistLength'] = playlistLength;
    return data;
  }
}
