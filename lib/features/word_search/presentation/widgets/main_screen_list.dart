import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/word_search/presentation/widgets/start_challenge_card.dart';

import '../../../../core/navigation/router_path.dart';

class MainScreenList extends ConsumerWidget {
  const MainScreenList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arg = ref.read(DI.wordInfoArgNotifier.notifier);
    return Column(
      children: <Widget>[const StartChallengeCard()] +
          ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                  10,
                  (_) => ListTile(
                        onTap: () {
                          arg.setState("car");
                          Navigator.pushNamed(
                              context, RouterPathContainer.wordInformationPage);
                        },
                        title: Text(
                          "word",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: const Text("description"),
                      ))).toList(),
    );
  }
}
