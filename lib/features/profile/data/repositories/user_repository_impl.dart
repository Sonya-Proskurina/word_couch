import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/core/logger.dart';
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
        logger.e("signIn user = null");
        return const Left("error");
      } else {
        final user = await userAuthDataSource.getUser();
        if (user != null) {
          return Right(user);
        } else {
          logger.e("signIn user = null");
          return const Left("error");
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        logger.e(e);
        return const Left("No user found that email");
      } else if (e.code == "wrong-password") {
        logger.e(e);
        return const Left("wrong password");
      } else {
        logger.e(e);
        return const Left("error");
      }
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity>> registration(String email) async {
    try {
      final res = await userAuthDataSource.registration(email);
      if (res == null) {
        logger.e("registration user null");
        return const Left("error");
      } else {
        return Right(UserTransformer.getEntity(res));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        logger.e(e);
        return const Left("The password is too weak");
      } else if (e.code == "email-already-in-use") {
        logger.e(e);
        return const Left("The account with such an email is already occupied");
      } else {
        logger.e(e);
        return const Left("error");
      }
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserEntity?>> getUser() async {
    try {
      final user = await userAuthDataSource.getUser();
      return Right(user);
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> exit() async {
    try {
      await userAuthDataSource.exit();
      return const Right(true);
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }
}
