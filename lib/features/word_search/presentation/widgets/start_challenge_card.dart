import 'package:flutter/material.dart';

import '../../../../core/navigation/router_path.dart';

class StartChallengeCard extends StatelessWidget {
  const StartChallengeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(6.0)),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouterPathContainer.challengePage,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Test your knowledge!",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Text("Play a game where you guess words meaning")
                    ],
                  )),
                  const Icon(Icons.keyboard_arrow_right_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouterPathContainer.challengePage,
              );
            },
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Test your knowledge!",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Text("Play a game where you guess words meaning")
                  ],
                )),
                const Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
          ),
        ),
      )*/
