import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';

class QuestionTypeGenerator {
  int amount;
  QuestionType type;

  QuestionTypeGenerator({required this.amount, required this.type});

  QuestionType generate() {
    if (amount > 0) {
      amount--;
      return type;
    }
    return QuestionType.none;
  }
}
