import 'package:flutter/material.dart';

import '../widgets/word_information_section.dart';

class WordInformationPage extends StatelessWidget {
  const WordInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          title: const Text(
            "word",
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
              Container(
                // This container represents the image showing the queried word
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.orangeAccent),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Full word description",
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
  }
}
