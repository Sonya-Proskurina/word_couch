import 'package:riverpod/riverpod.dart';
import 'registration_states.dart';

class RegistrationNotifier extends StateNotifier<RegistrationState> {
  RegistrationNotifier() : super(RegistrationState.loaded());

  void setError(String msg) {
    state = RegistrationState.error(msg);
  }

  void setLoading() {
    state = RegistrationState.loading();
  }

  void setLoaded() {
    state = RegistrationState.loaded();
  }

  void setUser() {
    state = RegistrationState.user();
  }
}
