import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_meaning_model.freezed.dart';

part 'word_meaning_model.g.dart';

@freezed
class WordMeaningModel with _$WordMeaningModel {
  const factory WordMeaningModel({
    @JsonKey(name: 'definition') required String? definition,
    @JsonKey(name: 'partOfSpeech') required String? partOfSpeech,
    @JsonKey(name: 'synonyms') required List<String>? synonyms,
    @JsonKey(name: 'antonyms') required List<String>? antonyms,
    @JsonKey(name: 'typeOf') required List<String>? typeOf,
    @JsonKey(name: 'derivation') required List<String>? derivation,
    @JsonKey(name: 'pertainsTo') required List<String>? pertainsTo,
    @JsonKey(name: 'regionOf') required List<String>? regionOf,
    @JsonKey(name: 'inRegion') required List<String>? inRegion,
    @JsonKey(name: 'hasUsages') required List<String>? hasUsages,
    @JsonKey(name: 'hasCategories') required List<String>? hasCategories,
    @JsonKey(name: 'inCategory') required List<String>? inCategory,
    @JsonKey(name: 'hasSubstances') required List<String>? hasSubstances,
    @JsonKey(name: 'substanceOf') required List<String>? substanceOf,
    @JsonKey(name: 'hasMembers') required List<String>? hasMembers,
    @JsonKey(name: 'memberOf') required List<String>? memberOf,
    @JsonKey(name: 'entails') required List<String>? entails,
    @JsonKey(name: 'also') required List<String>? also,
    @JsonKey(name: 'similarTo') required List<String>? similarTo,
    @JsonKey(name: 'hasInstances') required List<String>? hasInstances,
    @JsonKey(name: 'instanceOf') required List<String>? instanceOf,
    @JsonKey(name: 'hasParts') required List<String>? hasParts,
    @JsonKey(name: 'partOf') required List<String>? partOf,
    @JsonKey(name: 'hasTypes') required List<String>? hasTypes,
  }) = _WordMeaningModel;

  factory WordMeaningModel.fromJson(Map<String, Object?> json) =>
      _$WordMeaningModelFromJson(json);
}
