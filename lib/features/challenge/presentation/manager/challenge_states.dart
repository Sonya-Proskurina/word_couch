import 'package:word_couch/features/challenge/domain/entities/question_entity.dart';

class ChallengeState {
  ChallengeState._();

  factory ChallengeState.loading() => LoadingChallengeState();
  factory ChallengeState.error(String message) => ErrorChallengeState(message);
  factory ChallengeState.ready(QuestionEntity question) =>
      ReadyChallengeState(question);
  factory ChallengeState.end() => EndChallengeState();
}

class LoadingChallengeState extends ChallengeState {
  LoadingChallengeState() : super._();
}

class ErrorChallengeState extends ChallengeState {
  final String errorMessage;

  ErrorChallengeState(this.errorMessage) : super._();
}

class ReadyChallengeState extends ChallengeState {
  final QuestionEntity question;

  ReadyChallengeState(this.question) : super._();
}

class EndChallengeState extends ChallengeState {
  EndChallengeState() : super._();
}
