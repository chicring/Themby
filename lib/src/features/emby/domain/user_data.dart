class UserData {
  double? playedPercentage;
  int? playbackPositionTicks;
  int? unPlayedItemCount;
  int? playCount;
  bool? isFavorite;
  bool? played;

  UserData(
      {this.playedPercentage,
        this.playbackPositionTicks,
        this.unPlayedItemCount,
        this.playCount,
        this.isFavorite,
        this.played});

  UserData.fromJson(Map<String, dynamic> json) {
    playedPercentage = (((json['PlayedPercentage'] as num? ?? 0.0).toDouble()));
    playbackPositionTicks = json['PlaybackPositionTicks'];
    unPlayedItemCount = json['UnplayedItemCount'];
    playCount = json['PlayCount'];
    isFavorite = json['IsFavorite'];
    played = json['Played'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PlayedPercentage'] = playedPercentage;
    data['PlaybackPositionTicks'] = playbackPositionTicks;
    data['UnPlayedItemCount'] = unPlayedItemCount;
    data['PlayCount'] = playCount;
    data['IsFavorite'] = isFavorite;
    data['Played'] = played;
    return data;
  }
}