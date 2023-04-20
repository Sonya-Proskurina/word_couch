import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../../core/navigation/router_path.dart';
import '../manager/challenges_manager.dart';

class ChallengeFinishedWidget extends ConsumerWidget {
  const ChallengeFinishedWidget({super.key, required this.manager});

  final ChallengesManager manager;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
                  "The challenge is finished!",
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              PieChart(
                dataMap: {
                  "Correct": manager.progress.getCorrect().toDouble(),
                  "Incorrect": manager.progress.getIncorrect().toDouble(),
                  "Skipped": manager.progress.getSkipped().toDouble()
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
                    child: const Text("Go home")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
