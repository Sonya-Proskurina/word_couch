import 'package:flutter/material.dart';
import 'package:word_couch/word_search/presentation/widgets/main_screen_list.dart';
import 'package:word_couch/word_search/presentation/widgets/search_bar.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Material(
          child: Stack(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar.large(
                    leading: IconButton(
                        icon: const Icon(Icons.menu), onPressed: () {}),
                    title: const Text('Word Couch'),
                  ),
                  const SliverToBoxAdapter(
                    child: Card(child: MainScreenList()),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: SearchBar(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
