import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData themeWithBrightness(Brightness brightness) => ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorSchemeSeed: Colors.orangeAccent);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: themeWithBrightness(Brightness.dark),
      theme: themeWithBrightness(Brightness.light),
      home: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.large(
              leading:
                  IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
              title: const Text('Word Couch'),
            ),
            SliverToBoxAdapter(
              child: Card(
                child: Column(
                  children: [
                    PlayGameCard(),
                    Column(
                        children: List.generate(10, (_) => const CardWidget())),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayGameCard extends StatelessWidget {
  const PlayGameCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Test your knowledge!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text("Play a game where you guess words meaning",
                      style: Theme.of(context).textTheme.bodyMedium)
                ],
              )),
              const Icon(Icons.keyboard_arrow_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "word",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text("This is the word description",
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          )),
          const Icon(Icons.keyboard_arrow_right_outlined)
        ],
      ),
    );
  }
}
