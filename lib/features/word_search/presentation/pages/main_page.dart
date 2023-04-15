import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/profile/presentation/pages/profile_drawer.dart';
import '../widgets/main_screen_list.dart';
import '../widgets/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    ProfileManager manager = ref.read(DI.profileManager);
    WidgetsBinding.instance.addPostFrameCallback((_) => manager.loading());

    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: ProfileDrawer(),
      ),
      resizeToAvoidBottomInset: true,
      body: Material(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar.large(
                  leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      }),
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
