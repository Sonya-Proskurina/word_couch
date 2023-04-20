import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthWidget extends ConsumerStatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthWidget> createState() => _AuthLoadedWidgetState();
}

class _AuthLoadedWidgetState extends ConsumerState<AuthWidget> {
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
          child: SignInScreen(
            subtitleBuilder: (context, action) {
              return GestureDetector(
                onTap: () {
                  manager.goToRegistration();
                },
                child: Text(
                  AppLocalizations.of(context)!.noAccount,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Theme.of(context).primaryColor),
                ),
              );
            },
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
            styles: const {
              EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
            },
          ),
        ),
      ),
    );
  }
}
