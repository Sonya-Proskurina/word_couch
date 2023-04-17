import 'package:flutter/material.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';
import 'package:word_couch/features/word_search/presentation/widgets/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../profile/presentation/pages/profile_drawer.dart';
import 'main_screen_list.dart';

class MainUserWidget extends StatefulWidget {
  final List<UserWordEntity> history;

  const MainUserWidget({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  State<MainUserWidget> createState() => _MainUserWidgetState();
}

class _MainUserWidgetState extends State<MainUserWidget> {
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey();
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
                        // Navigator.pushNamed(context, RouterPathContainer.authPage, arguments: "");
                        _scaffoldKey.currentState!.openDrawer();
                      }),
                  title: Text(AppLocalizations.of(context)!.testText),
                ),
                SliverToBoxAdapter(
                  child: Card(
                      child: MainScreenList(
                    list: widget.history,
                  )),
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
  }
}
