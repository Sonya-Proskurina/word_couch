import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/ui/errors_widget.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';
import 'package:word_couch/features/word_search/presentation/widgets/main_user_widget.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  late ProfileManager manager;
  late ProfileState state;

  @override
  void initState() {
    super.initState();
    manager = ref.read(DI.profileManager);
    WidgetsBinding.instance.addPostFrameCallback((_) => manager.loading());
  }

  @override
  Widget build(BuildContext context) {
    state = ref.watch(manager.getNotifier());
    if (state is ProfileUserState) {
      return MainUserWidget(
        history: (state as ProfileUserState).list,
      );
    } else if (state is ProfileLoadingState) {
      return const LoadingWidget();
    } else if (state is ProfileNoUserState) {
      return const MainUserWidget(
        history: [],
      );
    } else if (state is ProfileErrorState) {
      return ErrorsWidget(
        text: (state as ProfileErrorState).msg,
        restart: () {
          manager.loading();
        },
      );
    } else {
      return ErrorsWidget(
        text: "Error",
        restart: () {
          manager.loading();
        },
      );
    }
  }
}
