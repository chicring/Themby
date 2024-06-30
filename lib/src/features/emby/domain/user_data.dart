class UserData {
  final int? unplayedItemCount;
  final int playbackPositionTicks;
  final double playbackPositionSeconds;
  final double playedPercentage;
  final int playCount;
  final bool isFavorite;
  final bool played;

  UserData({
    this.unplayedItemCount,
    required this.playbackPositionTicks,
    required this.playbackPositionSeconds,
    required this.playedPercentage,
    required this.playCount,
    required this.isFavorite,
    required this.played,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      unplayedItemCount: json['UnplayedItemCount'] ?? 0,
      playbackPositionTicks: json['PlaybackPositionTicks'] ?? 0,
      playbackPositionSeconds: json['PlaybackPositionSeconds'] ?? 0,
      playedPercentage: double.parse((json['PlayedPercentage'] ?? 0.0).toStringAsFixed(1)),
      playCount: json['PlayCount'] ?? 0,
      isFavorite: json['IsFavorite'] ?? false,
      played: json['Played'] ?? false,
    );
  }
}