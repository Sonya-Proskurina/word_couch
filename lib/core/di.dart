import 'package:riverpod/riverpod.dart';

import '../features/word_information/domain/manager/manager.dart';

class DI {
  static final wordInfoNotifier =
      StateNotifierProvider((ref) => WordInfoNotifier());

  static final wordInfoManager =
      Provider((ref) => WordInfoManager(ref.watch(wordInfoNotifier.notifier)));
}
