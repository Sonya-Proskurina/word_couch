import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';

import 'auth_notifier.dart';
import 'auth_states.dart';

class AuthManager {
  AuthNotifier notifier;
  UserRepository userRepository;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  AuthManager({
    required this.notifier,
    required this.userRepository,
  });

  void auth(String email, String password) async {
    notifier.setLoading();
    final res = await userRepository.signIn(
      email,
      password,
    );
    res.fold((l) {
      notifier.setError(l);
    }, (r) {
      notifier.setUser();
    });
  }

  void goToRegistration() {
    notifier.setRegistration();
  }

  void goToAuth() {
    notifier.setLoaded();
  }

  void loading() {
    email = TextEditingController();
    password = TextEditingController();
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

  void dispose() {
    email.dispose();
    password.dispose();
    notifier.setLoaded();
  }

  StateNotifierProvider<AuthNotifier, AuthState> getNotifier() {
    return StateNotifierProvider<AuthNotifier, AuthState>((ref) {
      return notifier;
    });
  }
}
