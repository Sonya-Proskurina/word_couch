import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordInformationSection extends StatelessWidget {
  const WordInformationSection(
      {super.key, required this.section, required this.sectionName});

  final List<String>? section;
  final String? sectionName;

  @override
  Widget build(BuildContext context) {
    if (section == null) {
      return const SizedBox();
    }
    return Column(
      children: [
        const SizedBox(height: 48.0),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      sectionName!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ] +
                section!.map((e) => Text(e)).toList(),
          ),
        )
      ],
    );
  }
}
