import 'package:json_annotation/json_annotation.dart';

part 'external_url.g.dart';

@JsonSerializable()
class ExternalUrl {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Url")
  String? url;

  ExternalUrl({
    this.name,
    this.url,
  });

  factory ExternalUrl.fromJson(Map<String, dynamic> json) => _$ExternalUrlFromJson(json);

  Map<String, dynamic> toJson() => _$ExternalUrlToJson(this);
}