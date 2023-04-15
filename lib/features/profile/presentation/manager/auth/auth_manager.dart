import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';

import 'auth_notifier.dart';
import 'auth_states.dart';

class AuthManager {
  AuthNotifier notifier;
  UserRepository userRepository;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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

  StateNotifierProvider<AuthNotifier, AuthState> getNotifier() {
    return StateNotifierProvider<AuthNotifier, AuthState>((ref) {
      return notifier;
    });
  }
}
