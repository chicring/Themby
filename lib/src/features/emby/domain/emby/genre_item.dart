import 'package:json_annotation/json_annotation.dart';

part 'genre_item.g.dart';

@JsonSerializable()
class GenreItem {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Id")
  int? id;

  GenreItem({
    this.name,
    this.id,
  });

  factory GenreItem.fromJson(Map<String, dynamic> json) => _$GenreItemFromJson(json);

  Map<String, dynamic> toJson() => _$GenreItemToJson(this);
}
