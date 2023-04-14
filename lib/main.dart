import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/navigation/router_path.dart';
import 'package:word_couch/word_search/presentation/widgets/main_screen_list.dart';
import 'package:word_couch/word_search/presentation/widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData themeWithBrightness(Brightness brightness) => ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorSchemeSeed: Colors.orangeAccent,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      darkTheme: themeWithBrightness(Brightness.dark),
      theme: themeWithBrightness(Brightness.light),
      supportedLocales: const [
        Locale('en'),
        // const Locale('ru')
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: RouterPathContainer.mainPage,
      routes: RouterPathContainer.routes,
    );
  }
}

// home: Scaffold(
//   resizeToAvoidBottomInset: true,
//   body: Material(
//     child: Stack(
//       children: [
//         CustomScrollView(
//           slivers: <Widget>[
//             SliverAppBar.large(
//               leading: IconButton(
//                   icon: const Icon(Icons.menu), onPressed: () {}),
//               title: const Text('Word Couch'),
//             ),
//             const SliverToBoxAdapter(
//               child: Card(child: MainScreenList()),
//             )
//           ],
//         ),
//         const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Align(
//             alignment: AlignmentDirectional.bottomCenter,
//             child: SearchBar(),
//           ),
//         )
//       ],
//     ),
//   ),
// ),