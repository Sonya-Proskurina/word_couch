import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/registration/registration_states.dart';

import '../manager/registration/registration_manager.dart';

class RegistrationPage extends ConsumerWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    RegistrationManager manager = ref.read(DI.registrationManager);
    RegistrationState state = ref.watch(manager.getNotifier());

    if (state is RegistrationLoadingState) {
      return const LoadingWidget();
    } else if (state is RegistrationLoadedState) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Registration"),
              const Text("email"),
              TextField(
                controller: manager.email,
              ),
              const SizedBox(height: 16),
              const Text("password"),
              TextField(
                controller: manager.password,
              ),
              TextButton(
                  onPressed: () async {
                    manager.registration(
                      manager.email.text,
                      manager.password.text,
                    );
                  },
                  child: const Text("Registration"))
            ],
          ),
        ),
      );
    } else if (state is RegistrationErrorState) {
      return Scaffold(
        body: SafeArea(
            child: Center(
              child: Text(state.msg),
            )),
      );
    } else if (state is RegistrationUserState) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => Navigator.pop(context));
      return const LoadingWidget();
    } else {
      return const Scaffold(
        body: SafeArea(
          child: Center(
            child: Text("Error"),
          ),
        ),
      );
    }
  }
}
