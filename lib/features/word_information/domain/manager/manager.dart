import 'package:riverpod/riverpod.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_arg_notifier.dart';
import 'package:word_couch/features/word_information/data/models/image/image_data.dart';
import 'package:word_couch/features/word_information/data/models/word_model.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_state.dart';

import '../entities/word_info.dart';
import '../repositories/word_info_repository.dart';

class WordInfoNotifier extends StateNotifier<WordInfoState> {
  WordInfoNotifier() : super(const WordInfoState.loading());

  void setError(String msg) {
    state = WordInfoState.error(msg);
  }

  void setSuccess(WordInfo value) {
    state = WordInfoState.success(value);
  }

  void set(WordModel wordInfo) {
    state.when(success: (value) {
      state = WordInfoState.success(WordInfo(wordInfo, value.image));
    }, error: (msg) {
      state = WordInfoState.success(WordInfo(wordInfo, null));
    }, loading: () {
      state = WordInfoState.success(WordInfo(wordInfo, null));
    });
  }

  void setImage(ImageData image) {
    state.when(success: (value) {
      state = WordInfoState.success(WordInfo(value.wordInfo, image));
    }, error: (msg) {
      state = WordInfoState.success(WordInfo(null, image));
    }, loading: () {
      state = WordInfoState.success(WordInfo(null, image));
    });
  }

  void setLoading() {
    state = const WordInfoState.loading();
  }
}

class WordInfoManager {
  WordInfoNotifier notifier;
  final WordInfoRepository _wordInfoRepository;
  final WordInfoArgNotifier argNotifier;

  WordInfoManager(this.notifier, this._wordInfoRepository, this.argNotifier);

  void _getWordInfoRes(String word) async {
    var res = await _wordInfoRepository.getWordInfo(word);
    res.fold((l) => notifier.setError(l), (r) => notifier.set(r));
  }

  void _getWordImage(String word) async {
    var res = await _wordInfoRepository.getWordImage(word);
    res.fold((l) => {}, (r) => notifier.setImage(r));
  }

  void getWordInfo(String word) {
    _getWordInfoRes(word);
    _getWordImage(word);
  }

  void init() {
    final word = argNotifier.getState();
    logger.d("WordInfoManager init: $word");
    getWordInfo(word);
  }
}
