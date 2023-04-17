import 'package:dartz/dartz.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> signIn(String email, String password);

  Future<Either<String, UserEntity>> registration(String email);

  Future<Either<String, UserEntity?>> getUser();

  Future<Either<String, List<UserWordEntity>>> getWordsHistory();

  Future<Either<String, bool>> exit();

  Future<Either<String, bool>> addFavorite(String word);
}
