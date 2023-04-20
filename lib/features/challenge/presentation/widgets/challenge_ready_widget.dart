import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenges_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:word_couch/features/challenge/presentation/widgets/question_title.dart';
import '../../../../core/navigation/router_path.dart';

class ChallengeReadyWidget extends ConsumerWidget {
  const ChallengeReadyWidget(
      {super.key, required this.manager, required this.question});
  final ChallengesManager manager;
  final QuestionEntity question;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.questionProgress(
            manager.getCurrentQuestion().toString(),
            manager.getTotalQuestions().toString())),
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(
                context, ModalRoute.withName(RouterPathContainer.mainPage));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              QuestionTitle(type: question.type, word: question.word),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: question.answers
                          .map<Widget>(
                            (e) => Padding(
                              padding: const EdgeInsets.only(bottom: 4.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    manager.getQuestion();
                                    if (e.isCorrect) {
                                      ref.read(DI.profileManager).addPoints(1);
                                      manager.progress.addCorrect();
                                    } else {
                                      manager.progress.addIncorrect();
                                    }
                                    Navigator.pushNamed(context,
                                        RouterPathContainer.challengePage);
                                  },
                                  child: Text(e.answer)),
                            ),
                          )
                          .toList() +
                      <Widget>[
                        TextButton(
                            onPressed: () {
                              manager.getQuestion();
                              manager.progress.addSkipped();
                              Navigator.pushNamed(
                                  context, RouterPathContainer.challengePage);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.iDoNotKnow,
                              textAlign: TextAlign.end,
                            ))
                      ],
                ),
              ),
            ],
          ),
        ),
      ));
}
