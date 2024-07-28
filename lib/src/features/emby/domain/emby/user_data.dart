import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  @JsonKey(name: "Rating")
  int? rating;
  @JsonKey(name: "PlayedPercentage")
  int? playedPercentage;
  @JsonKey(name: "UnplayedItemCount")
  int? unplayedItemCount;
  @JsonKey(name: "PlaybackPositionTicks")
  int? playbackPositionTicks;
  @JsonKey(name: "PlayCount")
  int? playCount;
  @JsonKey(name: "IsFavorite")
  bool? isFavorite;
  @JsonKey(name: "Likes")
  bool? likes;
  @JsonKey(name: "LastPlayedDate")
  DateTime? lastPlayedDate;
  @JsonKey(name: "Played")
  bool? played;
  @JsonKey(name: "Key")
  String? key;
  @JsonKey(name: "ItemId")
  String? itemId;

  UserData({
    this.rating,
    this.playedPercentage,
    this.unplayedItemCount,
    this.playbackPositionTicks,
    this.playCount,
    this.isFavorite,
    this.likes,
    this.lastPlayedDate,
    this.played,
    this.key,
    this.itemId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}