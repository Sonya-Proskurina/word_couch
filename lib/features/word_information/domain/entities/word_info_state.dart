import 'package:word_couch/features/word_information/domain/entities/word_info.dart';

class WordInfoState {
  WordInfoState._();

  factory WordInfoState.success(WordInfo foo) = WordInfoSuccessState;

  factory WordInfoState.error(String foo) = WordInfoErrorState;

  factory WordInfoState.loading() = WordInfoLoadingState;
}

class WordInfoErrorState extends WordInfoState {
  WordInfoErrorState(this.msg) : super._();

  final String msg;
}

class WordInfoSuccessState extends WordInfoState {
  WordInfoSuccessState(this.value) : super._();

  final WordInfo value;
}

class WordInfoLoadingState extends WordInfoState {
  WordInfoLoadingState() : super._();
}
