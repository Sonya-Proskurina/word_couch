import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final theme = (Brightness brightness) => ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorSchemeSeed: Colors.orangeAccent);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: theme(Brightness.dark),
      theme: theme(Brightness.light),
      home: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.large(
              leading:
                  IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
              title: const Text('Large App Bar'),
              actions: <Widget>[
                IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            SliverToBoxAdapter(
              child: Card(
                child: Column(
                    children: List.generate(10, (_) => const CardWidget())),
              ),
            )
          ],
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
                "Test your knowledge!",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text("Play a game where you guess words meaning",
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          )),
          const Icon(Icons.keyboard_arrow_right_outlined)
        ],
      ),
    );
  }
}
