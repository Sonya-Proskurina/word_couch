import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/core/navigation/router_path.dart';
import 'package:word_couch/features/challenge/data/repositories/challenges_repository.dart';
import 'package:word_couch/features/challenge/domain/use_cases/create_challenge_use_case.dart';

import '../../../../core/di.dart';

class ChallengeSettingsPage extends ConsumerStatefulWidget {
  const ChallengeSettingsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ChallengeSettingsPage> createState() =>
      _ChallengeSettingsPageState();
}

class _ChallengeSettingsPageState extends ConsumerState<ChallengeSettingsPage> {
  int _sliderSynonymsValue = 5;
  int _sliderAntonymsValue = 5;
  bool showErrorMessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set your challenge",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                          "Select the amount of synonyms you want to guess"),
                      Slider(
                        value: _sliderSynonymsValue.toDouble(),
                        max: 20,
                        label: _sliderSynonymsValue.toString(),
                        onChanged: (double value) {
                          setState(() {
                            _sliderSynonymsValue = value.round();
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                          "Select the amount of antonyms you want to guess"),
                      Slider(
                        value: _sliderAntonymsValue.toDouble(),
                        max: 20,
                        label: _sliderAntonymsValue.toString(),
                        onChanged: (double value) {
                          setState(() {
                            _sliderAntonymsValue = value.round();
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_sliderSynonymsValue + _sliderAntonymsValue ==
                                0) {
                              setState(() {
                                showErrorMessage = true;
                              });
                            } else {
                              ref
                                      .read(DI
                                          .createChallengeStateProvider.notifier)
                                      .state =
                                  CreateChallengeUseCase(
                                      ChallengesRepositoryImpl(),
                                      synonymsAmount: _sliderSynonymsValue,
                                      antonymsAmount: _sliderAntonymsValue);
                              ref.read(DI.challengesManager).getQuestion();
                              Navigator.pushNamed(
                                  context, RouterPathContainer.challengePage);
                            }
                          },
                          child: const Text("Start the challenge")),
                      AnimatedOpacity(
                        opacity: showErrorMessage ? 1 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: Text(
                            "You cannot start a challenge with no questions",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
