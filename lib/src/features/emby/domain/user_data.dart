class UserData {
  final int unplayedItemCount;
  final int playbackPositionTicks;
  final int playCount;
  final bool isFavorite;
  final bool played;

  UserData({
    required this.unplayedItemCount,
    required this.playbackPositionTicks,
    required this.playCount,
    required this.isFavorite,
    required this.played,
  });
}