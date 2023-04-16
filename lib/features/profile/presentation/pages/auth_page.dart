import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/ui/errors_widget.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_states.dart';
import 'package:word_couch/features/profile/presentation/widgets/auth_loaded_widget.dart';
import 'package:word_couch/features/profile/presentation/widgets/auth_registration_widget.dart';

class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  late AuthManager manager;

  @override
  void initState() {
    super.initState();
    manager = ref.read(DI.authManager);
  }

  @override
  Widget build(BuildContext context) {
    AuthState state = ref.watch(manager.getNotifier());

    if (state is AuthLoadingState) {
      return const LoadingWidget();
    } else if (state is AuthLoadedState) {
      return const AuthLoadedWidget();
    } else if (state is AuthUserState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
        ref.read(DI.profileManager).loading();
      });
      return const LoadingWidget();
    } else if (state is AuthErrorState) {
      return ErrorsWidget(
          text: state.msg,
          restart: () {
            manager.loading();
          });
    } else if (state is AuthRegistrationState) {
      return const AuthRegistrationWidget();
    } else {
      return ErrorsWidget(
          text: "Error",
          restart: () {
            manager.loading();
          });
    }
  }
}
