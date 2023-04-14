import 'package:flutter/material.dart';
import 'package:word_couch/core/navigation/router_path.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "MainPage",
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: const Text("go to word info"),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouterPathContainer.wordInformationPage,
              );
            },
          ),
          TextButton(
            child: const Text("go to profile info"),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouterPathContainer.profilePage,
              );
            },
          ),
          TextButton(
            child: const Text("go to challenge settings"),
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouterPathContainer.challengeSettingsPage,
              );
            },
          ),
        ],
      ),
    );
  }
}
