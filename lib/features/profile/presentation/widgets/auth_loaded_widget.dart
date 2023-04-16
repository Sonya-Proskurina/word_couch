import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_manager.dart';

class AuthLoadedWidget extends ConsumerStatefulWidget {
  const AuthLoadedWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthLoadedWidget> createState() => _AuthLoadedWidgetState();
}

class _AuthLoadedWidgetState extends ConsumerState<AuthLoadedWidget> {
  late AuthManager manager;

  @override
  void initState() {
    super.initState();
    manager = ref.read(DI.authManager);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SignInScreen(
                  showAuthActionSwitch: false,
                  providers: [
                    EmailAuthProvider(),
                  ],
                  actions: [
                    AuthStateChangeAction<SignedIn>((context, state) {
                      ref.read(DI.profileManager).loading();
                      Navigator.pop(context);
                    }),
                  ],
                ),
              ),
              Flexible(
                child: TextButton(
                  onPressed: () {
                    manager.goToRegistration();
                  },
                  child: const Text("Don't have an account? Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
