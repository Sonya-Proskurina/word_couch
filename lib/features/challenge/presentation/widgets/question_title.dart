import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionTitle extends StatelessWidget {
  const QuestionTitle({super.key, required this.type, required this.word});

  final QuestionType type;
  final String word;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case QuestionType.findSynonym:
        return Text(
          AppLocalizations.of(context)!.questionSynonymous(word),
          style: Theme.of(context).textTheme.headlineLarge,
        );
      case QuestionType.findAntonym:
        return Text(
          AppLocalizations.of(context)!.questionAntonymous(word),
          style: Theme.of(context).textTheme.headlineLarge,
        );
      case QuestionType.none:
        return const SizedBox();
    }
  }
}
