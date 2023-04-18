import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:word_couch/features/challenge/domain/entities/binary_answer_entity.dart';
import 'package:word_couch/features/challenge/domain/use_cases/question_type_generator.dart';

import '../../../../core/logger.dart';
import '../../../word_information/data/models/word_model.dart';
import '../../../word_information/domain/repositories/word_info_repository.dart';
import '../entities/question_entity.dart';
import '../entities/empty_question_entity.dart';

class CreateChallengeUseCase {
  final WordInfoRepository rep;
  final int synonymsAmount;
  final int antonymsAmount;
  final Random random = Random();

  CreateChallengeUseCase(
      {required this.synonymsAmount,
      required this.antonymsAmount,
      required this.rep});

  Iterable<QuestionType> _buildQuestionType() sync* {
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

  QuestionEntity? buildAntonymQuestion(WordModel model, String word) {
    final antonyms = model.results[0].antonyms;
    final similar = model.results[0].similarTo;
    if (antonyms != null &&
        antonyms.isNotEmpty &&
        similar != null &&
        similar.isNotEmpty) {
      final antonymWord = antonyms[random.nextInt(antonyms.length)];
      final similarWord = similar[random.nextInt(similar.length)];
      return QuestionEntity(
          question: 'What is antonymous to the $word?',
          answers: [
            BinaryAnswerEntity(answer: antonymWord, isCorrect: true),
            BinaryAnswerEntity(answer: similarWord, isCorrect: false)
          ],
          type: QuestionType.findAntonym);
    }
    return null;
  }

  QuestionEntity? buildSynonymQuestion(WordModel model, String word) {
    final synonyms = model.results[0].synonyms;
    final similar = model.results[0].similarTo;
    if (synonyms != null &&
        synonyms.isNotEmpty &&
        similar != null &&
        similar.isNotEmpty) {
      final randomSynonymWord = synonyms[random.nextInt(synonyms.length)];
      // Find words that are similar to the original one, but not synonyms
      final similarButNotSynonym =
          similar.toSet().difference(synonyms.toSet()).toList();
      if (similarButNotSynonym.isNotEmpty) {
        final randomSimilarWord =
            similarButNotSynonym[random.nextInt(similarButNotSynonym.length)];
        return QuestionEntity(
          question: 'What is synonymous to the $word?',
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

  Future<QuestionEntity?> buildQuestion() async {
    final type = _buildQuestionType().first;
    if (type == QuestionType.none) {
      return null;
    }
    QuestionEntity? question;
    int i = 0;
    // Try to generate a question of the specified QuestionType.
    // It may happen there is not enough similar or synonym words for a random
    // word, so it will try to generate one 10 times, and give up if it's unlucky.
    while (question == null && i < 10) {
      final word = await rep.getRandomWord();
      word.fold((l) {
        logger.e(l);
        // Something wrong with the internet, no need to try again, return null
        return null;
      }, (r) {
        switch (type) {
          case QuestionType.findSynonym:
            {
              // TODO add word
              question = buildSynonymQuestion(r);
              break;
            }
          case QuestionType.findAntonym:
            {
              // TODO add word
              question = buildAntonymQuestion(r);
              break;
            }
          // We already know it's not none
          case QuestionType.none:
            break;
        }
      });
      i++;
    }
    return question;
  }
}
