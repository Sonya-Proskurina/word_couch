import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenge_states.dart';

class ChallengeStateNotifier extends StateNotifier<ChallengeState> {
  ChallengeStateNotifier() : super(ChallengeState.loading());

  void setError(String message) {
    state = ChallengeState.error(message);
  }

  void setLoading() {
    state = ChallengeState.loading();
  }

  void setReady(QuestionEntity question) {
    state = ChallengeState.ready(question);
  }

  void setEnd() {
    state = ChallengeState.end();
  }
}
