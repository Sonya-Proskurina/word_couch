import 'package:word_couch/core/di.dart';

import '../../../../../core/simple_state_notifier.dart';

class SafeSearchNotifier extends SimpleStateNotifier<bool> {
  SafeSearchNotifier(bool state) : super(state);

  @override
  void setState(bool newState) {
    super.setState(newState);
    DI.safeSearchFlag = newState;
  }
}
