import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';
import 'auth_notifier.dart';
import 'auth_states.dart';

class AuthManager {
  AuthNotifier notifier;
  UserRepository userRepository;

  AuthManager({
    required this.notifier,
    required this.userRepository,
  });

  void goToRegistration() {
    notifier.setRegistration();
  }

  void goToAuth() {
    notifier.setLoaded();
  }

  void loaded() {
    notifier.setLoaded();
  }

  void registration(String email) async {
    notifier.setLoading();
    final res = await userRepository.registration(
      email,
    );
    res.fold((l) {
      notifier.setError(l);
    }, (r) {
      notifier.setUser();
    });
  }

  StateNotifierProvider<AuthNotifier, AuthState> getNotifier() {
    return StateNotifierProvider<AuthNotifier, AuthState>((ref) {
      return notifier;
    });
  }
}
