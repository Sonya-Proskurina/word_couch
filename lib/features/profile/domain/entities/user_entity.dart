import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';

class UserEntity {
  final String email;
  final String uid;
  final List<UserWordEntity> words;
  final int test;

  UserEntity({
    required this.email,
    required this.uid,
    required this.words,
    required this.test,
  });
}
