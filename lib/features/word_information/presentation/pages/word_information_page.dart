import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/ui/loading_widget.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/word_information/presentation/widgets/word_information_sections_list.dart';
import '../../../../core/di.dart';
import '../manager/manager.dart';
import '../../../profile/presentation/manager/user/user_states.dart';

class WordInformationPage extends ConsumerStatefulWidget {
  WordInformationPage({Key? key}) : super(key: key);

  final manager = DI.wordInfoManager;
  final managerUser = DI.profileManager;
  final notifier = DI.wordInfoNotifier;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WordInformationPageState();
}

class WordInformationPageState extends ConsumerState<WordInformationPage> {
  late WordInfoManager manager;
  late ProfileManager managerUser;

  @override
  void initState() {
    super.initState();
    manager = ref.read(widget.manager);
    managerUser = ref.read(widget.managerUser);
    manager.init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      manager.notifier.setLoading();
      ref.read(DI.profileManager).addHistory(manager.argNotifier.getState());
    });
  }

  @override
  Widget build(BuildContext context) {
    final wordInfoState = ref.watch(widget.notifier);
    return wordInfoState.when(success: (value) {
      if (ref.watch(managerUser.getNotifier()) is! ProfileUserState) {
        return const LoadingWidget();
      }
      return Material(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar.large(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Row(
              textBaseline: TextBaseline.alphabetic,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(manager.argNotifier.getState(),
                    style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  value.wordInfo?.results.first.partOfSpeech ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.apply(color: Colors.black54),
                )
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: TextButton.icon(
                    onPressed: () {
                      managerUser.addFavorite(manager.argNotifier.getState());
                    },
                    icon: Icon((ref.watch(managerUser.getNotifier())
                                as ProfileUserState)
                            .value
                            .favourite
                            .contains(manager.argNotifier.getState())
                        ? Icons.bookmark
                        : Icons.bookmark_outline),
                    label: const Text("Bookmark")),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                if (value.image?.value?.isNotEmpty == true &&
                    value.image?.value?.first.thumbnailUrl != null)
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(
                          value.image?.value?.first.thumbnailUrl ?? "",
                          fit: BoxFit.cover),
                    ),
                  ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          value.wordInfo?.results[0].definition ??
                              manager.argNotifier.getState(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      WordInformationSectionsList(
                          wordInfo: value.wordInfo?.results.first)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ));
    }, error: (error) {
      return const Material(
        child: Center(
          child: Text("Couldn't load the data"),
        ),
      );
    }, loading: () {
      return const Material(
          child: Center(
        child: CircularProgressIndicator(),
      ));
    });
  }
}
