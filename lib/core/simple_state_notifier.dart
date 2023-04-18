import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleStateNotifier<T> extends StateNotifier<T> {
  SimpleStateNotifier(super.state);

  void setState(T newState) {
    state = newState;
  }

  T getState() => state;
}
