class UserData {
  final int? unplayedItemCount;
  final int playbackPositionTicks;
  final int playCount;
  final bool isFavorite;
  final bool played;

  UserData({
    this.unplayedItemCount,
    required this.playbackPositionTicks,
    required this.playCount,
    required this.isFavorite,
    required this.played,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      unplayedItemCount: json['UnplayedItemCount'] ?? 0,
      playbackPositionTicks: json['PlaybackPositionTicks'] ?? 0,
      playCount: json['PlayCount'] ?? 0,
      isFavorite: json['IsFavorite'] ?? false,
      played: json['Played'] ?? false,
    );
  }
}