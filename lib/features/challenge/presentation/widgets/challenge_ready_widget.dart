import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/di.dart';
import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenges_manager.dart';

import '../../../../core/navigation/router_path.dart';

class ChallengeReadyWidget extends ConsumerWidget {
  const ChallengeReadyWidget(
      {super.key, required this.manager, required this.question});
  final ChallengesManager manager;
  final QuestionEntity question;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
      appBar: AppBar(
        title: Text(
            "${manager.getCurrentQuestion()} out of ${manager.getTotalQuestions()}"),
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
              Text(
                question.question,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
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
                                    Navigator.pushNamed(context,
                                        RouterPathContainer.challengePage);
                                    // TODO Do something if the answer is correct
                                    if (e.isCorrect) {
                                      ref.read(DI.profileManager).addPoints(1);
                                    }
                                  },
                                  child: Text(e.answer)),
                            ),
                          )
                          .toList() +
                      <Widget>[
                        TextButton(
                            onPressed: () {
                              manager.getQuestion();
                              Navigator.pushNamed(
                                  context, RouterPathContainer.challengePage);
                              // TODO Do something if you skip the question
                            },
                            child: const Text(
                              "I don't know, next",
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
