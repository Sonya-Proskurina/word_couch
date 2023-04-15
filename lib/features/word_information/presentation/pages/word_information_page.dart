import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di.dart';
import '../../domain/manager/manager.dart';
import '../widgets/word_information_section.dart';

class WordInformationPage extends ConsumerStatefulWidget {
  WordInformationPage({Key? key}) : super(key: key);

  final manager = DI.wordInfoManager;
  final notifier = DI.wordInfoNotifier;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WordInformationPageState();
}

class WordInformationPageState extends ConsumerState<WordInformationPage> {
  late WordInfoManager manager;
  // late String arg;

  @override
  void initState() {
    super.initState();
    manager = ref.read(widget.manager);
    manager.init();
    // arg = ref.watch(widget.argsNotifier);
  }

  @override
  Widget build(BuildContext context) {
    final wordInfoState = ref.watch(widget.notifier);

    return wordInfoState.when(success: (value) {
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
            title: Text(
              manager.argNotifier.getState(),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_outline),
                    label: const Text("Bookmark")),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Image.network(
                    value.image?.value?.first.thumbnailUrl ?? "",
                    fit: BoxFit.cover),
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
                          )
                        ] +
                        List<Widget>.generate(
                            10, (index) => const WordInformationSection()),
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
