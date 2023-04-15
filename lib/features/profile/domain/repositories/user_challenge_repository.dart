import 'package:dartz/dartz.dart';

abstract class UserChallengeRepository {
  /// Возвращает null, если пользователь проходил тест до входа в аккаунт
  Future<Either<String, int?>> getUserTestCount();

  Future<Either<String, bool>> addUserTestCount(int dopCount);
}

class MockChallengeRepositoryImpl implements UserChallengeRepository {
  int? count;

  MockChallengeRepositoryImpl({required this.count});

  @override
  Future<Either<String, bool>> addUserTestCount(int dopCount) async {
    if (count != null) {
      count = count! + dopCount;
      return const Right(true);
    } else {
      return const Left("No user auth error");
    }
  }

  @override
  Future<Either<String, int?>> getUserTestCount() async {
    return Right(count);
  }
}
