import 'package:flutter/material.dart';

class WordInformationPage extends StatelessWidget {
  const WordInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "WordInformationPage",
            textAlign: TextAlign.center,
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
