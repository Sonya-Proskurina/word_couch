// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageData _$$_ImageDataFromJson(Map<String, dynamic> json) => _$_ImageData(
      webSearchUrl: json['webSearchUrl'] as String?,
      value: (json['value'] as List<dynamic>?)
          ?.map((e) => Value.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageDataToJson(_$_ImageData instance) =>
    <String, dynamic>{
      'webSearchUrl': instance.webSearchUrl,
      'value': instance.value,
    };

_$_Value _$$_ValueFromJson(Map<String, dynamic> json) => _$_Value(
      webSearchUrl: json['webSearchUrl'] as String?,
      name: json['name'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      datePublished: json['datePublished'] == null
          ? null
          : DateTime.parse(json['datePublished'] as String),
      contentUrl: json['contentUrl'] as String?,
      encodingFormat: json['encodingFormat'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      accentColor: json['accentColor'] as String?,
    );

Map<String, dynamic> _$$_ValueToJson(_$_Value instance) => <String, dynamic>{
      'webSearchUrl': instance.webSearchUrl,
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl,
      'datePublished': instance.datePublished?.toIso8601String(),
      'contentUrl': instance.contentUrl,
      'encodingFormat': instance.encodingFormat,
      'width': instance.width,
      'height': instance.height,
      'thumbnail': instance.thumbnail,
      'accentColor': instance.accentColor,
    };

_$_Thumbnail _$$_ThumbnailFromJson(Map<String, dynamic> json) => _$_Thumbnail(
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$$_ThumbnailToJson(_$_Thumbnail instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
    };
