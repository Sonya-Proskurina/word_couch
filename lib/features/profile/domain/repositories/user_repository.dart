import 'package:dartz/dartz.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> registration(String email);

  Future<Either<String, UserEntity?>> getUser();

  Future<Either<String, bool>> exit();

  Future<Either<String, bool>> addFavorite(String word, bool add);

  Future<Either<String, bool>> addHistory(String word, String description);
}
