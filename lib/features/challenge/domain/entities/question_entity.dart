import 'binary_answer_entity.dart';

enum QuestionType {
  findSynonym,
  findAntonym,
  none;
}

class QuestionEntity {
  final String word;
  final List<BinaryAnswerEntity> answers;
  final QuestionType type;

  QuestionEntity(
      {required this.word, required this.answers, required this.type});

  @override
  bool operator ==(Object other) {
    if (other is QuestionEntity) {
      return other.word == word;
    }
    return false;
  }
}
