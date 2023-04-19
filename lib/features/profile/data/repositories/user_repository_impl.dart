import 'package:dartz/dartz.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
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
  Future<Either<String, UserEntity>> registration(String email) async {
    try {
      final res = await userAuthDataSource.registration(email);
      if (res == null) {
        logger.e("registration user null");
        return const Left("registration user null");
      } else {
        return Right(UserTransformer.getEntity(res));
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
  Future<Either<String, bool>> addFavorite(String word, bool add) async {
    try {
      await userAuthDataSource.changeFavorite(word, add);
      return const Right(true);
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> addHistory(
      String word, String description) async {
    try {
      await userAuthDataSource.addHistory(word, description);
      return const Right(true);
    } catch (e) {
      logger.e(e);
      return Left(e.toString());
    }
  }
}
