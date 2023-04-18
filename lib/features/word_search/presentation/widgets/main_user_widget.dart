import 'package:flutter/material.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/word_search/presentation/widgets/search_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/di.dart';
import '../../../profile/presentation/pages/profile_drawer.dart';
import 'main_screen_list.dart';


class MainUserWidget extends ConsumerStatefulWidget {
   final List<UserWordEntity> history;

  const MainUserWidget({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  ConsumerState<MainUserWidget> createState() => _MainUserWidgetState();
}

class _MainUserWidgetState extends ConsumerState<MainUserWidget> {
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
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: ref.watch(DI.searchBarInFocusStateProvider) ? 0 : 1,
            duration: const Duration(milliseconds: 200),
            child: AbsorbPointer(
              absorbing: ref.watch(DI.searchBarInFocusStateProvider),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar.large(
                    leading: IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          _scaffoldKey.currentState!.openDrawer();
                        }),
                    title: Text(AppLocalizations.of(context)!.appName),
                  ),
                  SliverToBoxAdapter(
                    child: Card(
                        child: MainScreenList(
                      list: widget.history,
                    )),
                  )
                ],
              ),
            ),
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
    );
  }
}
