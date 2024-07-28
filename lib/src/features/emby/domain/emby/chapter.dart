import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class Chapter {
  @JsonKey(name: "StartPositionTicks")
  int? startPositionTicks;
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "ImageTag")
  String? imageTag;

  Chapter({
    this.startPositionTicks,
    this.name,
    this.imageTag,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}