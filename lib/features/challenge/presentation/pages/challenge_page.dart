import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenges_manager.dart';

import '../../../../core/di.dart';
import '../../../../core/navigation/router_path.dart';
import '../manager/challenge_states.dart';
import '../widgets/challenge_finished_widget.dart';
import '../widgets/challenge_ready_widget.dart';

class ChallengePage extends ConsumerStatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ChallengePageState();
}

class ChallengePageState extends ConsumerState<ChallengePage> {
  late final ChallengesManager manager;

  @override
  void initState() {
    manager = ref.read(DI.challengesManager);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ChallengeState state = ref.watch(manager.getNotifier());

    if (state is LoadingChallengeState) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ErrorChallengeState) {
      return Scaffold(
        body: Center(
          child: Column(
            children: [
              Text(state.errorMessage),
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
    } else if (state is EndChallengeState) {
      return ChallengeFinishedWidget(
        manager: manager,
      );
    } else if (state is ReadyChallengeState) {
      return ChallengeReadyWidget(
        manager: manager,
        question: state.question,
      );
    }
    return const Scaffold(
      body: Center(
        child: Text("Something went really wrong... "),
      ),
    );
  }
}
