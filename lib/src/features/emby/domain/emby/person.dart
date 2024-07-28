import 'package:json_annotation/json_annotation.dart';


part 'person.g.dart';

@JsonSerializable()
class Person {
  @JsonKey(name: "Name")
  String? name;
  @JsonKey(name: "Id")
  String? id;
  @JsonKey(name: "Role")
  String? role;
  @JsonKey(name: "Type")
  String? type;
  @JsonKey(name: "PrimaryImageTag")
  String? primaryImageTag;

  Person({
    this.name,
    this.id,
    this.role,
    this.type,
    this.primaryImageTag,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}