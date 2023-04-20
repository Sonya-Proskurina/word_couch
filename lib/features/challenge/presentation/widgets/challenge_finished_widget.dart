import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/navigation/router_path.dart';
import '../manager/challenges_manager.dart';

class ChallengeFinishedWidget extends ConsumerWidget {
  const ChallengeFinishedWidget({super.key, required this.manager});

  final ChallengesManager manager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                "The challenge is finished!",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            Text("${manager.progress.getCorrect()} correct"),
            Text("${manager.progress.getIncorrect()} incorrect"),
            Text("${manager.progress.getSkipped()} skipped"),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: TextButton(
                  onPressed: () {
                    Navigator.popUntil(context,
                        ModalRoute.withName(RouterPathContainer.mainPage));
                  },
                  child: const Text("Go home")),
            )
          ],
        ),
      ),
    );
  }
}
