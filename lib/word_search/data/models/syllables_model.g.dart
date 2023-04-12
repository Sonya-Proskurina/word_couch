// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syllables_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SyllablesModel _$$_SyllablesModelFromJson(Map<String, dynamic> json) =>
    _$_SyllablesModel(
      count: json['count'] as int,
      list: (json['list'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SyllablesModelToJson(_$_SyllablesModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'list': instance.list,
    };
