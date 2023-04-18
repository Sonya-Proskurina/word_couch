import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/di.dart';
import '../../../../core/navigation/router_path.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  late final TextEditingController textController;
  late final FocusNode focusNode;

  @override
  void initState() {
    textController = TextEditingController();
    focusNode = FocusNode()
      ..addListener(() {
        ref.read(DI.searchBarInFocusStateProvider.notifier).state =
            focusNode.hasFocus ? true : false;
      });
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(64),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: TextField(
                controller: textController,
                focusNode: focusNode,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.search,
                    border: InputBorder.none),
                onTapOutside: (_) {
                  focusNode.unfocus();
                },
                onSubmitted: (word) {
                  ref.read(DI.wordInfoArgNotifier.notifier).setState(word);
                  Navigator.pushNamed(
                      context, RouterPathContainer.wordInformationPage);
                },
              ),
            ),
          ),
          Visibility(
            visible: ref.watch(ref.read(DI.profileManager).getNotifier())
                is ProfileUserState,
            child: IconButton(
              onPressed: () {
                ref.read(DI.profileManager).changeFilterMod();
              },
              icon: Icon(ref.read(DI.profileManager).favoriteMod
                  ? Icons.bookmark
                  : Icons.bookmark_outline),
            ),
          ),
        ],
      ),
    );
  }
}
