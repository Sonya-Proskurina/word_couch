import 'package:dartz/dartz.dart';

import '../entities/question_entity.dart';

abstract class ChallengesRepository {
  Either<String, QuestionEntity> getSynonymQuestion();
  Either<String, QuestionEntity> getAntonymQuestion();
  Future<void> init();
}
