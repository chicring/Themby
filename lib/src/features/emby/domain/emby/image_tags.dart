import 'package:json_annotation/json_annotation.dart';

part 'image_tags.g.dart';

@JsonSerializable()
class ImageTags {

  @JsonKey(name: "Primary")
  String? primary;
  @JsonKey(name: "Backdrop")
  String? backdrop;
  @JsonKey(name: "Logo")
  String? logo;
  @JsonKey(name: "Thumb")
  String? thumb;
  @JsonKey(name: "Banner")
  String? banner;

  ImageTags({
    this.primary,
    this.backdrop,
    this.logo,
    this.thumb,
    this.banner,
  });

  factory ImageTags.fromJson(Map<String, dynamic> json) => _$ImageTagsFromJson(json);

  Map<String, dynamic> toJson() => _$ImageTagsToJson(this);
}
