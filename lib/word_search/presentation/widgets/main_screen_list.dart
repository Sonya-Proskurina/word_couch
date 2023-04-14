import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_couch/word_search/presentation/widgets/play_game_card.dart';

class MainScreenList extends StatelessWidget {
  const MainScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[const PlayGameCard()] +
          ListTile.divideTiles(
              context: context,
              tiles: List.generate(
                  10,
                  (_) => ListTile(
                        title: Text(
                          "word",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        subtitle: const Text("description"),
                      ))).toList(),
    );
  }
}
