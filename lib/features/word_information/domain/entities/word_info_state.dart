import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info.dart';

part 'word_info_state.freezed.dart';

@freezed
class WordInfoState with _$WordInfoState {
  const factory WordInfoState.success(WordInfo info) = WordInfoSuccessState;
  const factory WordInfoState.error(String msg) =
  WordInfoErrorState;
  const factory WordInfoState.loading() = WordInfoLoadingState;
}