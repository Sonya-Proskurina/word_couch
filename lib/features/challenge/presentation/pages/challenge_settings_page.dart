import 'package:flutter/material.dart';
import 'package:word_couch/core/navigation/router_path.dart';

class ChallengeSettingsPage extends StatefulWidget {
  const ChallengeSettingsPage({Key? key}) : super(key: key);

  @override
  State<ChallengeSettingsPage> createState() => _ChallengeSettingsPageState();
}

class _ChallengeSettingsPageState extends State<ChallengeSettingsPage> {
  double _sliderSynonymsValue = 5;
  double _sliderAntonymsValue = 5;

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
                        value: _sliderSynonymsValue,
                        max: 20,
                        label: _sliderSynonymsValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _sliderSynonymsValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                          "Select the amount of antonyms you want to guess"),
                      Slider(
                        value: _sliderAntonymsValue,
                        max: 20,
                        label: _sliderAntonymsValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _sliderAntonymsValue = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouterPathContainer.challengePage);
                          },
                          child: const Text("Start the challenge"))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
