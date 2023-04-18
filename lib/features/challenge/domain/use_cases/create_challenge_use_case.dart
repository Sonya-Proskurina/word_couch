import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:word_couch/features/challenge/domain/use_cases/question_type_generator.dart';

import '../entities/question_entity.dart';
import '../entities/empty_question_entity.dart';

class CreateChallengeUseCase {
  final int synonymsAmount;
  final int antonymsAmount;

  CreateChallengeUseCase(
      {required this.synonymsAmount, required this.antonymsAmount});

  Iterable<QuestionType> _buildQuestionType() sync* {
    final random = Random();
    final generators = [
      QuestionTypeGenerator(
          amount: synonymsAmount, type: QuestionType.findSynonym),
      QuestionTypeGenerator(
          amount: antonymsAmount, type: QuestionType.findAntonym)
    ];
    Set<int> full = List.generate(generators.length, (index) => index).toSet();
    while (full.isNotEmpty) {
      QuestionType type = QuestionType.none;
      while (type != QuestionType.none) {
        final list = full.toList();
        final i = random.nextInt(list.length);
        type = generators[list[i]].generate();
        if (type == QuestionType.none) {
          full.remove(list[i]);
        }
      }
      yield type;
    }
    yield QuestionType.none;
  }

  Iterable<Either<QuestionEntity, EmptyQuestionEntity>> buildQuestion() sync* {
    final questions = synonymsAmount + antonymsAmount;
    for (final _ in Iterable.generate(questions)) {
      final type = _buildQuestionType();
      // Get a random word;
      // Take its random synonym + one similar word
      // yield the result
    }
    yield Right(EmptyQuestionEntity());
  }
}
