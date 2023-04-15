import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/navigation/router_path.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_states.dart';

class AuthPage extends ConsumerWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    AuthManager manager = ref.read(DI.authManager);
    AuthState state = ref.watch(manager.getNotifier());

    if (state is AuthLoadingState) {
      return const LoadingWidget();
    } else if (state is AuthLoadedState) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    manager.auth(
                      manager.email.text,
                      manager.password.text,
                    );
                  },
                  child: const Text("Sign In")),
              TextButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, RouterPathContainer.registratiohPage);
                  },
                  child: const Text("Registration"))
            ],
          ),
        ),
      );
    } else if (state is AuthErrorState) {
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: Text(state.msg),
        )),
      );
    } else if (state is AuthUserState) {
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
