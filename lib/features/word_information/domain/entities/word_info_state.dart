import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info.dart';

part 'word_info_state.freezed.dart';

@freezed
class WordInfoState with _$WordInfoState {
  const factory WordInfoState.success(WordInfo foo) = WordInfoSuccessState;
  const factory WordInfoState.error(String foo) = WordInfoErrorState;
  const factory WordInfoState.loading() = WordInfoLoadingState;
}

// class WordInfoErrorState extends WordInfoState {
//   WordInfoErrorState(this.msg) : super._();
//
//   final String msg;
// }
//
// class WordInfoSuccessState extends WordInfoState {
//   WordInfoSuccessState(this.value) : super._();
//
//   final WordInfo value;
// }
//
// class WordInfoLoadingState extends WordInfoState {
//   WordInfoLoadingState() : super._();
// }
