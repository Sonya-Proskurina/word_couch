import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/word_information_section.dart';

class WordInformationPage extends StatelessWidget {
  const WordInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar.large(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text("word"),
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
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
                  List.generate(10, (index) => const WordInformationSection()),
            ),
          ),
        )
      ],
    ));
  }
}
