import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/di.dart';
import '../../domain/entities/question_entity.dart';
import '../../domain/use_cases/create_challenge_use_case.dart';

class ChallengePage extends ConsumerStatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ChallengePageState();
}

class ChallengePageState extends ConsumerState<ChallengePage> {
  late CreateChallengeUseCase challenge;
  QuestionEntity? question;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    challenge = ref.read(DI.createChallengeStateProvider);
    // Set the question to the loading state
    ref.read(DI.questionLoadedStateProvider.notifier).state = false;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      question = await challenge.buildQuestion();
      // Data is loaded, the question is ready to be shown
      ref.read(DI.questionLoadedStateProvider.notifier).state = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // If the question is loading
    if (!ref.watch(DI.questionLoadedStateProvider)) {
      return const Scaffold(
        body: CircularProgressIndicator(),
      );
      // If the question is null, no more question could be loaded
    } else if (question == null) {
      return const Scaffold(body: Text("The challenge is finished"));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
              "${challenge.currentQuestion} out of ${challenge.questionsAmount}"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
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
                  question!.question,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: question!.answers
                            .map<Widget>(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: ElevatedButton(
                                    onPressed: () {}, child: Text(e.answer)),
                              ),
                            )
                            .toList() +
                        <Widget>[
                          TextButton(
                              onPressed: () {},
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
}
