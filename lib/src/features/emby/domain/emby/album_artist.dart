import 'package:json_annotation/json_annotation.dart';

part 'album_artist.g.dart';

@JsonSerializable()
class AlbumArtist {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Id")
  String? id;

  AlbumArtist({
    this.name,
    this.id,
  });

  factory AlbumArtist.fromJson(Map<String, dynamic> json) => _$AlbumArtistFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumArtistToJson(this);
}