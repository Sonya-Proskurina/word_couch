import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/navigation/router_path.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ProfileManager manager = ref.read(DI.profileManager);
    ProfileState state = ref.watch(manager.getNotifier());
    if (state is ProfileLoadingState) {
      return const LoadingWidget();
    } else if (state is ProfileNoUserState) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouterPathContainer.authPage);
                  },
                  child: const Text("Войдите в профиль"),
                )
              ],
            ),
          ),
        ),
      );
    } else if (state is ProfileUserState) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(state.value.email),
                Text(state.value.favourite.join(", ")),
                Text(state.value.story.join(", ")),
                Text(state.value.test.toString()),
              ],
            ),
          ),
        ),
      );
    } else if (state is ProfileErrorState) {
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: Text(state.msg),
        )),
      );
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
