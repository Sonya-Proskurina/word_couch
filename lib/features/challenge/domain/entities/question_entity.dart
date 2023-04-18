import 'binary_answer_entity.dart';

enum QuestionType {
  findSynonym,
  findAntonym,
  none;
}

class QuestionEntity {
  final String question;
  final List<BinaryAnswerEntity> answers;
  final QuestionType type;

  QuestionEntity(
      {required this.question, required this.answers, required this.type});
}
