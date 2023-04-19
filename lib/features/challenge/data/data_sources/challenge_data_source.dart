import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:word_couch/features/challenge/domain/entities/binary_answer_entity.dart';

import '../../../../core/constants/firebase_const.dart';
import '../../domain/entities/question_entity.dart';

class ChallengeDataSource {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  final random = Random();

  Future<QuestionEntity> getSynonymQuestion() async {
    // get the synonyms tests collection
    final collection =
        firebase.collection(FirebaseConst.pathFindSynonymChallenges);
    // get the amount of questions in the collection
    final count = (await collection.count().get()).count;
    // retrieve the first N elements, where N is a random number,
    // and take the last as the future question
    final questionMap =
        (await collection.limit(random.nextInt(count) + 1).snapshots().last)
            .docs[0]
            .data();
    final question = questionMap['word'];
    // build answers as BinaryAnswerEntity from the firebase map
    final answers = (questionMap['answers'] as List<Map<String, dynamic>>)
        .map<BinaryAnswerEntity>((element) {
      return BinaryAnswerEntity(
          answer: element["word"], isCorrect: element["isCorrect"]);
    }).toList();
    return QuestionEntity(
        question: "What is synonymous to $question?",
        answers: answers,
        type: QuestionType.findSynonym);
  }
}
