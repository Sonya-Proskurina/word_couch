import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/word_search/presentation/widgets/start_challenge_card.dart';

import '../../../../core/navigation/router_path.dart';

class MainScreenList extends ConsumerWidget {
  final List<String> list;

  const MainScreenList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context, ref) {
    final arg = ref.read(DI.wordInfoArgNotifier.notifier);
    if (list.isEmpty) {
      return Column(
        children: [
          const StartChallengeCard(),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              "Empty search history",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      );
    }
    return Column(
      children: <Widget>[const StartChallengeCard()] +
          ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                  list.length,
                  (index) => ListTile(
                        onTap: () {
                          arg.setState("car");
                          Navigator.pushNamed(
                              context, RouterPathContainer.wordInformationPage);
                        },
                        title: Text(
                          list[index],
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: Text(list[index]),
                      ))).toList(),
    );
  }
}
