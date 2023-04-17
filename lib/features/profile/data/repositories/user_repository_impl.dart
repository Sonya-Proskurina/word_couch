import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';
import 'package:word_couch/features/word_information/domain/repositories/word_info_repository.dart';
import '../models/user_transformer.dart';

class UserRepositoryImpl implements UserRepository {
  UserAuthDataSource userAuthDataSource;
  WordInfoRepository wordInfoRepositoryImpl;

  UserRepositoryImpl({
    required this.userAuthDataSource,
    required this.wordInfoRepositoryImpl,
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

  @override
  Future<Either<String, List<UserWordEntity>>> getWordsHistory() async {
    try {
      List<UserWordEntity> list = [];
      final user = await userAuthDataSource.getUser();
      if (user?.history != null) {
        final favourite = user?.favourite ?? [];
        for (int i = 0; i < user!.history.length; i++) {
          final descriptionRes =
              await wordInfoRepositoryImpl.getWordInfo(user.history[i]);
          String description = "";
          descriptionRes.fold((l) => description = "",
              (r) => description = r.results[0].definition ?? "");
          UserWordEntity userWordEntity = UserWordEntity(
            word: user.history[i],
            isFavourite: favourite.contains(user.history[i]),
            isHistory: true,
            description: description,
          );
          description = "";
          list.add(userWordEntity);
        }
      }
      return Right(list);
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }
}
