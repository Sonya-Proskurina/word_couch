// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordModel _$$_WordModelFromJson(Map<String, dynamic> json) => _$_WordModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => WordMeaningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      syllables: json['syllables'] == null
          ? null
          : SyllablesModel.fromJson(json['syllables'] as Map<String, dynamic>),
      pronunciation: (json['pronunciation'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$$_WordModelToJson(_$_WordModel instance) =>
    <String, dynamic>{
      'results': instance.results,
      'syllables': instance.syllables,
      'pronunciation': instance.pronunciation,
    };
