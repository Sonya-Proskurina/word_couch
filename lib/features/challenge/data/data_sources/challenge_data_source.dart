import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:word_couch/features/challenge/domain/entities/binary_answer_entity.dart';

import '../../../../core/constants/firebase_const.dart';
import '../../domain/entities/question_entity.dart';

class ChallengeDataSource {
  final _firebase = FirebaseFirestore.instance;
  List<QuestionEntity> _synonymQuestionsList = [];
  int _iSynonym = 0;
  List<QuestionEntity> _antonymQuestionsList = [];
  int _iAntonym = 0;

  static Future<ChallengeDataSource> initAll() async {
    final obj = ChallengeDataSource();
    await obj._initAll();
    return obj;
  }

  Future<void> _initAll() async {
    await _initSynonyms();
    await _initAntonyms();
  }

  Future<void> _initSynonyms() async {
    final collection =
        _firebase.collection(FirebaseConst.pathFindSynonymChallenges);
    final snapshot = await collection.get();
    final snapshotsList = snapshot.docs..shuffle();
    _synonymQuestionsList = snapshotsList.map((e) {
      final map = e.data();
      final question = map["word"];
      final answers = (map['answers']).map<BinaryAnswerEntity>((element) {
        return BinaryAnswerEntity(
            answer: element["word"], isCorrect: element["isCorrect"]);
      }).toList();
      return QuestionEntity(
          question: "What is synonymous to the '$question'?",
          answers: answers,
          type: QuestionType.findSynonym);
    }).toList();
  }

  Future<void> _initAntonyms() async {
    final collection =
        _firebase.collection(FirebaseConst.pathFindAntonymChallenges);
    final snapshot = await collection.get();
    final snapshotsList = snapshot.docs..shuffle();
    _antonymQuestionsList = snapshotsList.map((e) {
      final map = e.data();
      final question = map["word"];
      final answers = (map['answers']).map<BinaryAnswerEntity>((element) {
        return BinaryAnswerEntity(
            answer: element["word"], isCorrect: element["isCorrect"]);
      }).toList();
      return QuestionEntity(
          question: "What is antonymous to the '$question'?",
          answers: answers,
          type: QuestionType.findAntonym);
    }).toList();
  }

  QuestionEntity? getSynonymQuestion() {
    if (_synonymQuestionsList.isEmpty) {
      return null;
    }
    final q = _synonymQuestionsList[_iSynonym];
    _iSynonym++;
    return q;
  }

  QuestionEntity? getAntonymQuestion() {
    if (_antonymQuestionsList.isEmpty) {
      return null;
    }
    final q = _antonymQuestionsList[_iAntonym];
    _iAntonym++;
    return q;
  }
}
