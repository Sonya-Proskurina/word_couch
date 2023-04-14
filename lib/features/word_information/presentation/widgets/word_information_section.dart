import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordInformationSection extends StatelessWidget {
  const WordInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 48.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Text(
            "Section name",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Column(
          children: List.generate(
              10,
              (index) => Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 4.0),
                    child: Text("parameter $index"),
                  )),
        )
      ],
    );
  }
}
