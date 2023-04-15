import 'package:riverpod/riverpod.dart';
import 'package:word_couch/core/api_client.dart';

import '../features/word_information/data/repositories/word_info_repository.dart';
import '../features/word_information/domain/manager/manager.dart';

class DI {
  static final wordInfoNotifier =
      StateNotifierProvider((ref) => WordInfoNotifier());

  static final wordInfoManager =
      Provider((ref) => WordInfoManager(ref.watch(wordInfoNotifier.notifier), ref.watch(wordInfoRepository)));

  static final wordsApiClient = Provider((ref) => WordsApiClient());

  static final imageSearchApiClient = Provider((ref) => ImageApiClient());

  static final wordInfoRepository = Provider((ref) => WordInfoRepositoryImpl(
      ref.watch(wordsApiClient), ref.watch(imageSearchApiClient)));
}
