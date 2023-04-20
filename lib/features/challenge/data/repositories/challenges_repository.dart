import 'package:dartz/dartz.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/challenge/data/data_sources/challenge_data_source.dart';

import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';

import '../../domain/repositories/challenges_repository.dart';

class ChallengesRepositoryImpl implements ChallengesRepository {
  late ChallengeDataSource _challengesDataSource;

  @override
  Future<void> init() async {
    _challengesDataSource = await ChallengeDataSource.initAll();
  }

  @override
  Either<String, QuestionEntity> getAntonymQuestion() {
    try {
      final question = _challengesDataSource.getAntonymQuestion();
      if (question == null) {
        return const Left("No more questions left");
      }
      return Right(question);
    } catch (e) {
      logger.e(e);
      return const Left("Error while loading the question");
    }
  }

  @override
  Either<String, QuestionEntity> getSynonymQuestion() {
    try {
      final question = _challengesDataSource.getSynonymQuestion();
      if (question == null) {
        return const Left("No more questions left");
      }
      return Right(question);
    } catch (e) {
      logger.e(e);
      return const Left("Error while loading the question");
    }
  }
}
