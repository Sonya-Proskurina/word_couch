import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:word_couch/features/challenge/domain/entities/binary_answer_entity.dart';
import 'package:word_couch/features/challenge/domain/repositories/challenges_repository.dart';
import 'package:word_couch/features/challenge/domain/use_cases/question_type_generator.dart';

import '../../../../core/logger.dart';
import '../../../word_information/data/models/word_model.dart';
import '../entities/question_entity.dart';

class CreateChallengeUseCase {
  final int synonymsAmount;
  final int antonymsAmount;
  late final int questionsAmount;
  int currentQuestion = 0;
  final Random _random = Random();
  final ChallengesRepository _challengesRepository;
  final List<QuestionTypeGenerator> generators;
  late final Set<int> categories;

  CreateChallengeUseCase(this._challengesRepository,
      {required this.synonymsAmount, required this.antonymsAmount})
      : questionsAmount = synonymsAmount + antonymsAmount,
        generators = [
          QuestionTypeGenerator(
              amount: synonymsAmount, type: QuestionType.findSynonym),
          QuestionTypeGenerator(
              amount: antonymsAmount, type: QuestionType.findAntonym)
        ] {
    categories = List.generate(generators.length, (index) => index).toSet();
  }

  QuestionType _buildQuestionType() {
    if (categories.isEmpty) {
      return QuestionType.none;
    }
    final list = categories.toList();
    final i = _random.nextInt(list.length);
    final type = generators[list[i]].generate();
    if (type == QuestionType.none) {
      categories.remove(list[i]);
      return _buildQuestionType();
    }
    return type;
  }

  QuestionEntity? buildAntonymQuestion(WordModel model) {
    final antonyms = model.results[0].antonyms;
    final similar = model.results[0].similarTo;
    if (antonyms != null &&
        antonyms.isNotEmpty &&
        similar != null &&
        similar.isNotEmpty) {
      final antonymWord = antonyms[_random.nextInt(antonyms.length)];
      final similarWord = similar[_random.nextInt(similar.length)];
      return QuestionEntity(
          question: 'What is antonymous to the ${model.word}?',
          answers: [
            BinaryAnswerEntity(answer: antonymWord, isCorrect: true),
            BinaryAnswerEntity(answer: similarWord, isCorrect: false)
          ],
          type: QuestionType.findAntonym);
    }
    return null;
  }

  QuestionEntity? buildSynonymQuestion(WordModel model) {
    final synonyms = model.results[0].synonyms;
    final similar = model.results[0].similarTo;
    if (synonyms != null &&
        synonyms.isNotEmpty &&
        similar != null &&
        similar.isNotEmpty) {
      final randomSynonymWord = synonyms[_random.nextInt(synonyms.length)];
      // Find words that are similar to the original one, but not synonyms
      final similarButNotSynonym =
          similar.toSet().difference(synonyms.toSet()).toList();
      if (similarButNotSynonym.isNotEmpty) {
        final randomSimilarWord =
            similarButNotSynonym[_random.nextInt(similarButNotSynonym.length)];
        return QuestionEntity(
          question: 'What is synonymous to the ${model.word}?',
          answers: [
            BinaryAnswerEntity(answer: randomSynonymWord, isCorrect: true),
            BinaryAnswerEntity(answer: randomSimilarWord, isCorrect: false)
          ],
          type: QuestionType.findSynonym,
        );
      }
    }
    return null;
  }

  Future<Either<String, QuestionEntity>?> buildQuestion() async {
    final type = _buildQuestionType();
    logger.d(type);
    switch (type) {
      case QuestionType.none:
        return null;
      case QuestionType.findSynonym:
        {
          final question = await _challengesRepository.getSynonymQuestion();
          // Return null if we have an error while loading the synonym question
          return question.fold((l) => Left(l), (r) {
            currentQuestion++;
            return Right(r);
          });
        }
      case QuestionType.findAntonym:
        {
          final question = await _challengesRepository.getAntonymQuestion();
          // Return null if we have an error while loading the antonym question
          return question.fold((l) => Left(l), (r) {
            currentQuestion++;
            return Right(r);
          });
        }
    }
  }
}
