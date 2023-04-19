import 'package:dartz/dartz.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/challenge/data/data_sources/challenge_data_source.dart';

import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';

import '../../domain/repositories/challenges_repository.dart';

class ChallengesRepositoryImpl implements ChallengesRepository {
  final challengesDataSource = ChallengeDataSource();

  @override
  Future<Either<String, QuestionEntity>> getAntonymQuestion() async {
    try {
      final question = await challengesDataSource.getAntonymQuestion();
      return Right(question);
    } catch (e) {
      logger.e(e);
      return const Left("Error while loading the question");
    }
  }

  @override
  Future<Either<String, QuestionEntity>> getSynonymQuestion() async {
    try {
      final question = await challengesDataSource.getSynonymQuestion();
      return Right(question);
    } catch (e) {
      logger.e(e);
      return const Left("Error while loading the question");
    }
  }
}
