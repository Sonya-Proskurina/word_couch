import 'package:flutter/material.dart';
import 'package:word_couch/core/navigation/router_path.dart';

class ChallengeSettingsPage extends StatelessWidget {
  const ChallengeSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "ChallengeSettingsPage",
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: const Text("go challenge page"),
            onPressed: () {
              Navigator.pushReplacementNamed(
                context,
                RouterPathContainer.challengePage,
              );
            },
          ),
          TextButton(
            child: const Text("back"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
