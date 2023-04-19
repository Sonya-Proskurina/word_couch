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
    final snapshot = await collection.get();
    final docIndex = random.nextInt(snapshot.docs.length);
    final questionMap = snapshot.docs[docIndex].data();
    final question = questionMap['word'];
    // build answers as BinaryAnswerEntity from the firebase map
    final answers = (questionMap['answers']).map<BinaryAnswerEntity>((element) {
      return BinaryAnswerEntity(
          answer: element["word"], isCorrect: element["isCorrect"]);
    }).toList();
    return QuestionEntity(
        question: "What is synonymous to the '$question'?",
        answers: answers,
        type: QuestionType.findSynonym);
  }

  Future<QuestionEntity> getAntonymQuestion() async {
    // get the antonyms tests collection
    final collection =
        firebase.collection(FirebaseConst.pathFindAntonymChallenges);
    final snapshot = await collection.get();
    final docIndex = random.nextInt(snapshot.docs.length);
    final questionMap = snapshot.docs[docIndex].data();
    final question = questionMap['word'];
    // build answers as BinaryAnswerEntity from the firebase map
    final answers = (questionMap['answers']).map<BinaryAnswerEntity>((element) {
      return BinaryAnswerEntity(
          answer: element["word"], isCorrect: element["isCorrect"]);
    }).toList();
    return QuestionEntity(
        question: "What is antonymous to '$question?'",
        answers: answers,
        type: QuestionType.findAntonym);
  }
}
