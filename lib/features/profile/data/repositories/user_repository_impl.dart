import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/data/data_sources/user_local_data_source.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';

import '../data_sources/user_registration_data_source.dart';
import '../models/user_transformer.dart';

class UserRepositoryImpl implements UserRepository {
  UserAuthDataSource userAuthDataSource;
  UserRegistrationDataSource userRegistrationDataSource;
  UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({
    required this.userAuthDataSource,
    required this.userRegistrationDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<String, UserEntity>> signIn(
      String email, String password) async {
    try {
      final res = await userAuthDataSource.signIn(email, password);
      if (res == null) {
        return const Left("error");
      } else {
        final user = await userAuthDataSource.getUser(res.uid);
        if (user != null) {
          userLocalDataSource.addUser(res.uid);
          return Right(user);
        } else {
          return const Left("error");
        }
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

  @override
  Future<Either<String, UserEntity>> registration(
      String email, String password) async {
    try {
      final res =
          await userRegistrationDataSource.registration(email, password);
      if (res == null) {
        return const Left("error");
      } else {
        userLocalDataSource.addUser(res.uid);
        return Right(UserTransformer.getEntity(res));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        return const Left("The password is too weak");
      } else if (e.code == "email-already-in-use") {
        return const Left("The account with such an email is already occupied");
      } else {
        return const Left("error");
      }
    }
  }

  @override
  Future<Either<String, UserEntity?>> getUser() async {
    try {
      final res = await userLocalDataSource.getUser();
      if (res == null) {
        return const Right(null);
      } else {
        final user = await userAuthDataSource.getUser(res);
        return Right(user);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
