import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordInfoArgNotifier extends StateNotifier<String> {
  WordInfoArgNotifier(super.state);

  void setState(String newState) {
    state = newState;
  }

  String getState() => state;
}
