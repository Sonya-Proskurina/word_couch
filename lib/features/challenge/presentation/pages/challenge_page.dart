import 'package:flutter/material.dart';

class ChallengePage extends StatelessWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("3 out of 10"),
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
                  "What is synonymous with the \"plane\"?",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text("airplane")),
                      const SizedBox(
                        height: 4.0,
                      ),
                      ElevatedButton(
                          onPressed: () {}, child: const Text("airplane")),
                      const SizedBox(
                        height: 4.0,
                      ),
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
