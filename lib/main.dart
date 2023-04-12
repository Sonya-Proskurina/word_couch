import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorSchemeSeed: Colors.orange[900],
      ),
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
            // Just some content big enough to have something to scroll.
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
