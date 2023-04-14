import 'package:freezed_annotation/freezed_annotation.dart';

part 'syllables_model.freezed.dart';

part 'syllables_model.g.dart';

@freezed
class SyllablesModel with _$SyllablesModel {
  const factory SyllablesModel({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'list') required List<String> list,
  }) = _SyllablesModel;

  factory SyllablesModel.fromJson(Map<String, Object?> json) =>
      _$SyllablesModelFromJson(json);
}
