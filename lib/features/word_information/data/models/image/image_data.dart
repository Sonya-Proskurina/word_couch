import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_data.freezed.dart';
part 'image_data.g.dart';

@freezed
class ImageData with _$ImageData {
  const factory ImageData({
    String? webSearchUrl,
    List<Value>? value,
  }) = _ImageData;

  factory ImageData.fromJson(Map<String, dynamic> json) => _$ImageDataFromJson(json);
}

@freezed
class Value with _$Value {
  const factory Value({
    String? webSearchUrl,
    String? name,
    String? thumbnailUrl,
    DateTime? datePublished,
    String? contentUrl,
    String? encodingFormat,
    int? width,
    int? height,
    Thumbnail? thumbnail,
    String? accentColor,
  }) = _Value;

  factory Value.fromJson(Map<String, dynamic> json) => _$ValueFromJson(json);
}

@freezed
class Thumbnail with _$Thumbnail {
  const factory Thumbnail({
    int? width,
    int? height,
  }) = _Thumbnail;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);
}