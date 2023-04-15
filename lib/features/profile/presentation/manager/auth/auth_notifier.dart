import 'package:riverpod/riverpod.dart';
import 'auth_states.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.loaded());

  void setError(String msg) {
    state = AuthState.error(msg);
  }

  void setLoading() {
    state = AuthState.loading();
  }

  void setLoaded() {
    state = AuthState.loaded();
  }

  void setUser() {
    state = AuthState.user();
  }
}
