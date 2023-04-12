// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_meaning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WordMeaningModel _$$_WordMeaningModelFromJson(Map<String, dynamic> json) =>
    _$_WordMeaningModel(
      definition: json['definition'] as String?,
      partOfSpeech: json['partOfSpeech'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      typeOf:
          (json['typeOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
      derivation: (json['derivation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      pertainsTo: (json['pertainsTo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      regionOf: (json['regionOf'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      inRegion: (json['inRegion'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasUsages: (json['hasUsages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasCategories: (json['hasCategories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      inCategory: (json['inCategory'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasSubstances: (json['hasSubstances'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      substanceOf: (json['substanceOf'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasMembers: (json['hasMembers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      memberOf: (json['memberOf'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      entails:
          (json['entails'] as List<dynamic>?)?.map((e) => e as String).toList(),
      also: (json['also'] as List<dynamic>?)?.map((e) => e as String).toList(),
      similarTo: (json['similarTo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasInstances: (json['hasInstances'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      instanceOf: (json['instanceOf'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      hasParts: (json['hasParts'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      partOf:
          (json['partOf'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hasTypes: (json['hasTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_WordMeaningModelToJson(_$_WordMeaningModel instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'partOfSpeech': instance.partOfSpeech,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
      'typeOf': instance.typeOf,
      'derivation': instance.derivation,
      'pertainsTo': instance.pertainsTo,
      'regionOf': instance.regionOf,
      'inRegion': instance.inRegion,
      'hasUsages': instance.hasUsages,
      'hasCategories': instance.hasCategories,
      'inCategory': instance.inCategory,
      'hasSubstances': instance.hasSubstances,
      'substanceOf': instance.substanceOf,
      'hasMembers': instance.hasMembers,
      'memberOf': instance.memberOf,
      'entails': instance.entails,
      'also': instance.also,
      'similarTo': instance.similarTo,
      'hasInstances': instance.hasInstances,
      'instanceOf': instance.instanceOf,
      'hasParts': instance.hasParts,
      'partOf': instance.partOf,
      'hasTypes': instance.hasTypes,
    };
