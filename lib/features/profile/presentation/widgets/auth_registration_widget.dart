import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import '../manager/auth/auth_manager.dart';

class AuthRegistrationWidget extends ConsumerStatefulWidget {
  const AuthRegistrationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthRegistrationWidget> createState() =>
      _AuthRegistrationWidgetState();
}

class _AuthRegistrationWidgetState
    extends ConsumerState<AuthRegistrationWidget> {
  late AuthManager manager;

  @override
  void initState() {
    super.initState();
    manager = ref.read(DI.authManager);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            manager.goToAuth();
          },
        ),
      ),
      body: SafeArea(
        child: RegisterScreen(
          showAuthActionSwitch: false,
          providers: [
            EmailAuthProvider(),
          ],
          actions: [
            AuthStateChangeAction<UserCreated>(
              (context, state) {
                manager.registration(state.credential.user?.email ?? "");
              },
            ),
          ],
          styles: const {
            EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
          },
        ),
      ),
    );
  }
}
