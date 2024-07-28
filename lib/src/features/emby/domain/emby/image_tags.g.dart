// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageTags _$ImageTagsFromJson(Map<String, dynamic> json) => ImageTags(
      primary: json['Primary'] as String?,
      backdrop: json['Backdrop'] as String?,
      logo: json['Logo'] as String?,
      thumb: json['Thumb'] as String?,
      banner: json['Banner'] as String?,
    );

Map<String, dynamic> _$ImageTagsToJson(ImageTags instance) => <String, dynamic>{
      'Primary': instance.primary,
      'Backdrop': instance.backdrop,
      'Logo': instance.logo,
      'Thumb': instance.thumb,
      'Banner': instance.banner,
    };
