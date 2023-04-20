import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenge_states.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenges_state_notifier.dart';

import '../../domain/use_cases/create_challenge_use_case.dart';

class ChallengesManager {
  final ChallengeStateNotifier _notifier;
  final CreateChallengeUseCase _challenge;

  ChallengesManager(this._notifier, this._challenge);

  Future<void> initRepository() async {
    await _challenge.initRepository();
  }

  void initChallenge(int synonyms, int antonyms) {
    _challenge.initChallenge(synonyms, antonyms);
  }

  void getQuestion() {
    _notifier.setLoading();
    final eitherQuestion = _challenge.buildQuestion();
    if (eitherQuestion == null) {
      _notifier.setEnd();
    } else {
      eitherQuestion.fold((l) {
        _notifier.setError(l);
      }, (r) {
        _notifier.setReady(r);
      });
    }
  }

  int getCurrentQuestion() {
    return _challenge.currentQuestion;
  }

  int getTotalQuestions() {
    return _challenge.questionsAmount;
  }

  StateNotifierProvider<ChallengeStateNotifier, ChallengeState> getNotifier() =>
      StateNotifierProvider<ChallengeStateNotifier, ChallengeState>(
          (ref) => _notifier);
}
