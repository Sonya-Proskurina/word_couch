import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_couch/features/word_information/presentation/widgets/word_information_section.dart';

import '../../data/models/word_meaning_model.dart';

class WordInformationSectionsList extends StatelessWidget {
  const WordInformationSectionsList({super.key, required this.wordInfo});

  final WordMeaningModel? wordInfo;

  @override
  Widget build(BuildContext context) {
    if (wordInfo == null) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WordInformationSection(
            section: wordInfo!.synonyms, sectionName: "Synonyms"),
        WordInformationSection(
            section: wordInfo!.antonyms, sectionName: "Antonyms"),
        WordInformationSection(
            section: wordInfo!.typeOf, sectionName: "Type of"),
        WordInformationSection(
            section: wordInfo!.derivation, sectionName: "Derivation"),
        const SizedBox(
          height: 16.0,
        )
      ],
    );
  }
}
