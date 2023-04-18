import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';
import 'package:word_couch/features/profile/presentation/widgets/profile_no_user_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/ui/errors_widget.dart';
import '../widgets/profile_user_widget.dart';

class ProfileDrawer extends ConsumerWidget {
  const ProfileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ProfileManager manager = ref.read(DI.profileManager);
    ProfileState state = ref.watch(manager.getNotifier());
    if (state is ProfileLoadingState) {
      return const LoadingWidget();
    } else if (state is ProfileNoUserState) {
      return const ProfileNoUserWidget();
    } else if (state is ProfileUserState) {
      return ProfileUserWidget(
        userEntity: state.user,
      );
    } else if (state is ProfileErrorState) {
      return ErrorsWidget(
        text: state.msg,
        restart: () {
          manager.loading();
        },
      );
    } else {
      return ErrorsWidget(
        text: AppLocalizations.of(context)!.error,
        restart: () {
          manager.loading();
        },
      );
    }
  }
}
