import 'package:dartz/dartz.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<String, UserEntity>> signIn(String email, String password);
}
