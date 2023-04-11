import 'package:freezed_annotation/freezed_annotation.dart';

import 'syllables_model.dart';
import 'word_meaning_model.dart';

part 'word_model.freezed.dart';

part 'word_model.g.dart';

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    required List<WordMeaningModel> results,
    required SyllablesModel? syllables,
    required Map<String, String>? pronunciation,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, Object?> json) =>
      _$WordModelFromJson(json);
}
