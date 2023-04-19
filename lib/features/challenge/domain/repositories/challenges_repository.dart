import 'package:dartz/dartz.dart';

import '../entities/question_entity.dart';

abstract class ChallengesRepository {
  Future<Either<String, QuestionEntity>> getSynonymQuestion();
  Future<Either<String, QuestionEntity>> getAntonymQuestion();
}
