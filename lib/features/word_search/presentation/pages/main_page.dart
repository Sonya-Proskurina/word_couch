import 'package:flutter/material.dart';
import '../widgets/main_screen_list.dart';
import '../widgets/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Material(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar.large(
                  leading: IconButton(
                      icon: const Icon(Icons.menu), onPressed: () {}),
                  title: Text(AppLocalizations.of(context)!.testText),
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
    );
    // return Scaffold(
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Text(
    //         "MainPage",
    //         textAlign: TextAlign.center,
    //       ),
    //       TextButton(
    //         child: const Text("go to word info"),
    //         onPressed: () {
    //           Navigator.pushNamed(
    //             context,
    //             RouterPathContainer.wordInformationPage,
    //           );
    //         },
    //       ),
    //       TextButton(
    //         child: const Text("go to profile info"),
    //         onPressed: () {
    //           Navigator.pushNamed(
    //             context,
    //             RouterPathContainer.profilePage,
    //           );
    //         },
    //       ),
    //       TextButton(
    //         child: const Text("go to challenge settings"),
    //         onPressed: () {
    //           Navigator.pushNamed(
    //             context,
    //             RouterPathContainer.challengeSettingsPage,
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
