import 'package:riverpod/riverpod.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_arg_notifier.dart';
import 'package:word_couch/features/word_information/data/models/image/image_data.dart';
import 'package:word_couch/features/word_information/data/models/word_model.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_state.dart';

import '../../domain/entities/word_info.dart';
import '../../domain/repositories/word_info_repository.dart';

class WordInfoNotifier extends StateNotifier<WordInfoState> {
  WordInfoNotifier() : super(const WordInfoState.loading());

  void setError(String msg) {
    state = WordInfoState.error(msg);
  }

  void setSuccess(WordInfo value, bool? favorite) {
    state = WordInfoState.success(value, favorite);
  }

  void set(WordModel wordInfo, bool? favorite) {
    state.when(success: (value, isFavorite) {
      state =
          WordInfoState.success(WordInfo(wordInfo, value.image), isFavorite);
    }, error: (msg) {
      state = WordInfoState.success(WordInfo(wordInfo, null), favorite);
    }, loading: () {
      state = WordInfoState.success(WordInfo(wordInfo, null), favorite);
    });
  }

  void setImage(ImageData image, bool? favorite) {
    state.when(success: (value, isFavorite) {
      state =
          WordInfoState.success(WordInfo(value.wordInfo, image), isFavorite);
    }, error: (msg) {
      state = WordInfoState.success(WordInfo(null, image), favorite);
    }, loading: () {
      state = WordInfoState.success(WordInfo(null, image), favorite);
    });
  }

  void setLoading() {
    state = const WordInfoState.loading();
  }
}

class WordInfoManager {
  WordInfoNotifier notifier;
  bool? isFavorite;
  late WordModel wordModel;
  ImageData? image;
  final WordInfoRepository _wordInfoRepository;
  final WordInfoArgNotifier argNotifier;

  WordInfoManager(this.notifier, this._wordInfoRepository, this.argNotifier);

  void _getWordInfoRes(String word) async {
    var res = await _wordInfoRepository.getWordInfo(word);
    res.fold((l) => notifier.setError(l), (r) {
      notifier.set(r, isFavorite);
      wordModel = r;
      if (r.results.isNotEmpty) {
        _getWordImage(
            "$word ${r.results.first.synonyms?.take(2).join(' ') ?? ''}");
      } else {
        notifier.setError("Can't find word info");
      }
    });
  }

  void _getWordImage(String word) async {
    var res = await _wordInfoRepository.getWordImage(word);
    res.fold((l) => {}, (r) {
      image = r;
      notifier.setImage(r, isFavorite);
    });
  }

  void getWordInfo(String word) {
    _getWordInfoRes(word);
  }

  void changeFavorite() {
    notifier.setLoading();
    isFavorite = !(isFavorite!);
    notifier.set(wordModel, isFavorite);
    if (wordModel.results.isNotEmpty && image != null) {
      notifier.setImage(image!, isFavorite);
    }
  }

  void init(bool? favorite) {
    final word = argNotifier.getState();
    isFavorite = favorite;
    logger.d("WordInfoManager init: $word");
    getWordInfo(word);
  }
}
