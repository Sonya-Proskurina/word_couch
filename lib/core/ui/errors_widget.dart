import 'package:flutter/material.dart';

class ErrorsWidget extends StatelessWidget {
  final String text;
  final Function restart;

  const ErrorsWidget({
    Key? key,
    required this.text,
    required this.restart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Text(text),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    restart();
                  },
                  child: const Text("Restart"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
