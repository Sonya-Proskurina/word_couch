import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';

import 'registration_notifier.dart';
import 'registration_states.dart';

class RegistrationManager {
  RegistrationNotifier notifier;
  UserRepository userRepository;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RegistrationManager({
    required this.notifier,
    required this.userRepository,
  });

  void registration(String email, String password) async {
    notifier.setLoading();
    final res = await userRepository.registration(
      email,
      password,
    );
    res.fold((l) {
      notifier.setError(l);
    }, (r) {
      notifier.setUser();
    });
  }

  StateNotifierProvider<RegistrationNotifier, RegistrationState> getNotifier() {
    return StateNotifierProvider<RegistrationNotifier, RegistrationState>((ref) {
      return notifier;
    });
  }
}
