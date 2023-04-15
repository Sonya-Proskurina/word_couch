import 'package:riverpod/riverpod.dart';
import 'package:word_couch/features/word_information/data/repositories/word_info_repository.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_arg_notifier.dart';
import 'package:word_couch/features/word_information/data/models/image/image_data.dart';
import 'package:word_couch/features/word_information/data/models/word_model.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_state.dart';

import '../entities/word_info.dart';
import '../repositories/word_info_repository.dart';

class WordInfoNotifier extends StateNotifier<WordInfoState> {
  WordInfoNotifier() : super(WordInfoState.loading());
  void setError(String msg) {
    state = WordInfoState.error(msg);
  }

  void setSuccess(WordInfo value) {
    state = WordInfoState.success(value);
  }

  void set(WordModel wordInfo) {
    state = WordInfoState.success(WordInfo(wordInfo, null));
  }

  void setImage(ImageData image) {
    if (state.runtimeType == WordInfoSuccessState) {
      var wordInfo = (state as WordInfoSuccessState).value;
      state = WordInfoState.success(WordInfo(wordInfo.wordInfo, image));
    } else {
      state = WordInfoState.success(WordInfo(null, image));
    }
  }

  void setLoading() {
    state = WordInfoState.loading();
  }
}

class WordInfoManager {
  WordInfoNotifier notifier;
<<<<<<< lib/features/word_information/domain/manager/manager.dart
  final WordInfoRepository _wordInfoRepository;
  final WordInfoArgNotifier argNotifier;
  WordInfoManager(this.notifier, this._wordInfoRepository, this.argNotifier);
  
  void getWordInfo(String word) async {
    //notifier.setLoading();
    var res = await WordInfoRepositoryImpl.getWordInfo(word);
    res.fold(
      (l) => notifier.setError(l),
      (r) => notifier.setSuccess(WordInfo(r, null)),
    );

  void _getWordInfoRes(String word) async {
    var res = await _wordInfoRepository.getWordInfo(word);
    res.fold((l) => notifier.setError(l), (r) => notifier.set(r));
  }

  void _getWordImage(String word) async {
    var res = await _wordInfoRepository.getWordImage(word);
    res.fold((l) => {}, (r) => notifier.setImage(r));
  }

  void getWordInfo(String word) {
    notifier.setLoading();
    _getWordInfoRes(word);
    _getWordImage(word);
  }

  void init() {
    final word = argNotifier.getState();
    getWordInfo(word);
  }
}
