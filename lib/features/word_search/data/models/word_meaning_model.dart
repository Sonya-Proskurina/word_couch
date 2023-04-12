import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_meaning_model.freezed.dart';

part 'word_meaning_model.g.dart';

@freezed
class WordMeaningModel with _$WordMeaningModel {
  const factory WordMeaningModel({
    required String? definition,
    required String? partOfSpeech,
    required List<String>? synonyms,
    required List<String>? antonyms,
    required List<String>? typeOf,
    required List<String>? derivation,
    required List<String>? pertainsTo,
    required List<String>? regionOf,
    required List<String>? inRegion,
    required List<String>? hasUsages,
    required List<String>? hasCategories,
    required List<String>? inCategory,
    required List<String>? hasSubstances,
    required List<String>? substanceOf,
    required List<String>? hasMembers,
    required List<String>? memberOf,
    required List<String>? entails,
    required List<String>? also,
    required List<String>? similarTo,
    required List<String>? hasInstances,
    required List<String>? instanceOf,
    required List<String>? hasParts,
    required List<String>? partOf,
    required List<String>? hasTypes,
  }) = _WordMeaningModel;

  factory WordMeaningModel.fromJson(Map<String, Object?> json) =>
      _$WordMeaningModelFromJson(json);
}
