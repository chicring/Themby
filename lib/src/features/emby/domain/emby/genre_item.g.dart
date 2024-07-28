// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenreItem _$GenreItemFromJson(Map<String, dynamic> json) => GenreItem(
      name: json['Name'] as String?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GenreItemToJson(GenreItem instance) => <String, dynamic>{
      'Name': instance.name,
      'Id': instance.id,
    };
