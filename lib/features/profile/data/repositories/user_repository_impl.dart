import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';

import '../models/user_transformer.dart';

class UserRepositoryImpl implements UserRepository {
  UserAuthDataSource userAuthDataSource;

  UserRepositoryImpl({
    required this.userAuthDataSource,
  });

  @override
  Future<Either<String, UserEntity>> signIn(
      String email, String password) async {
    try {
      final res = await userAuthDataSource.signIn(email, password);
      if (res == null) {
        return const Left("error");
      } else {
        return Right(UserTransformer.getEntity(res));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        return const Left("No user found that email");
      } else if (e.code == "wrong-password") {
        return const Left("wrong password");
      } else {
        return const Left("error");
      }
    }
  }
}
