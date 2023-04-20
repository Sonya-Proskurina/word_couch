import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';
import 'package:word_couch/features/word_search/presentation/widgets/history_item_widget.dart';
import 'package:word_couch/features/word_search/presentation/widgets/start_challenge_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/navigation/router_path.dart';

class MainScreenList extends ConsumerWidget {
  final List<UserWordEntity> list;

  const MainScreenList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context, ref) {
    if (list.isEmpty) {
      return Column(
        children: [
          const StartChallengeCard(),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SvgPicture.asset(
              "assets/noHistory.svg",
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              AppLocalizations.of(context)!.errorEmptySearch,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      );
    }
    return Column(
      children: <Widget>[const StartChallengeCard()] +
          ListTile.divideTiles(
            context: context,
            tiles: List.generate(
              list.length,
              (index) => HistoryItemWidget(
                userWordEntity: list[index],
                addWord: () {
                  ref
                      .read(DI.profileManager)
                      .addFavorite(list[index].word, !list[index].isFavourite);
                },
                tap: () {
                  ref
                      .read(DI.wordInfoArgNotifier.notifier)
                      .setState(list[index].word);
                  Navigator.pushNamed(
                      context, RouterPathContainer.wordInformationPage,
                      arguments: list[index].isFavourite);
                },
              ),
            ),
          ).toList(),
    );
  }
}
