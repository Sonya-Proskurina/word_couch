import 'package:riverpod/riverpod.dart';
import 'package:word_couch/features/word_information/data/repositories/word_info_repository.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_state.dart';

import '../entities/word_info.dart';

class WordInfoNotifier extends StateNotifier<WordInfoState> {
  WordInfoNotifier(): super(WordInfoState.loading());
  void setError(String msg) {
    state = WordInfoState.error(msg);
  }
  void setSuccess(WordInfo value) {
    state = WordInfoState.success(value);
  }
  void setLoading() {
    state = WordInfoState.loading();
  }
}

class WordInfoManager {
  WordInfoNotifier notifier;
  WordInfoManager(this.notifier);

  void getWordInfo(String word) async {
    notifier.setLoading();
    var res = await WordInfoRepositoryImpl.getWordInfo(word);
    res.fold(
          (l) => notifier.setError(l),
          (r) => notifier.setSuccess(WordInfo(r, null)),
    );
  }
}