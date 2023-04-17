import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';

class HistoryItemWidget extends StatelessWidget {
  final Function() tap;
  final Function() addWord;
  final UserWordEntity userWordEntity;

  const HistoryItemWidget({
    Key? key,
    required this.userWordEntity,
    required this.tap,
    required this.addWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        tap();
      },
      trailing: IconButton(
          onPressed: () {
            addWord();
          },
          icon: (userWordEntity.isFavourite)
              ? const Icon(CupertinoIcons.bookmark_fill)
              : const Icon(CupertinoIcons.bookmark)),
      title: Text(
        userWordEntity.word,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(userWordEntity.description),
    );
  }
}
