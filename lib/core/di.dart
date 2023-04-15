import 'package:riverpod/riverpod.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_arg_notifier.dart';

import '../features/word_information/domain/entities/word_info_state.dart';
import '../features/word_information/domain/manager/manager.dart';

class DI {
  static final wordInfoNotifier =
      StateNotifierProvider<WordInfoNotifier, WordInfoState>(
          (ref) => WordInfoNotifier());

  static final wordInfoManager = Provider((ref) => WordInfoManager(
      ref.watch(wordInfoNotifier.notifier),
      ref.watch(wordInfoArgNotifier.notifier)));

  static final wordInfoArgNotifier =
      StateNotifierProvider<WordInfoArgNotifier, String>(
          (ref) => WordInfoArgNotifier(""));
}
