import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../core/di.dart';
import '../../../../core/navigation/router_path.dart';
import '../manager/challenges_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChallengeFinishedWidget extends ConsumerStatefulWidget {
  const ChallengeFinishedWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ChallengeFinishedWidgetState();
}

class ChallengeFinishedWidgetState extends ConsumerState {
  late final ConfettiController confetti;
  late final ChallengesManager manager;

  @override
  void initState() {
    super.initState();
    confetti = ConfettiController(duration: const Duration(seconds: 1));
    manager = ref.read(DI.challengesManager);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      confetti.play();
    });
  }

  @override
  void dispose() {
    super.dispose();
    confetti.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    AppLocalizations.of(context)!.challengeFinished,
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
                PieChart(
                  dataMap: {
                    AppLocalizations.of(context)!.correct:
                        manager.progress.getCorrect().toDouble(),
                    AppLocalizations.of(context)!.incorrect:
                        manager.progress.getIncorrect().toDouble(),
                    AppLocalizations.of(context)!.skipped:
                        manager.progress.getSkipped().toDouble()
                  },
                  colorList: const [
                    Colors.green,
                    Colors.redAccent,
                    Colors.blueAccent
                  ],
                  chartRadius: MediaQuery.of(context).size.width - 128,
                  animationDuration: const Duration(milliseconds: 600),
                  legendOptions: const LegendOptions(
                      legendPosition: LegendPosition.bottom,
                      showLegendsInRow: true),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context,
                            ModalRoute.withName(RouterPathContainer.mainPage));
                      },
                      child: Text(AppLocalizations.of(context)!.goHome)),
                ),
              ],
            ),
          ),
        ),
      ),
      Center(
        child: ConfettiWidget(
            confettiController: confetti,
            blastDirection: pi,
            blastDirectionality: BlastDirectionality.explosive),
      ),
    ]);
  }
}
