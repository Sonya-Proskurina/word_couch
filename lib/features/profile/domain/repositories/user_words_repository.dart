import 'package:dartz/dartz.dart';

abstract class UserWordsRepository {
  Future<Either<String, bool>> addFavouriteWord(String word);

  Future<Either<String, bool>> addHistoryWord(String word);

  /// true - если слово есть в истоии пользователя
  Future<Either<String, bool>> getHistoryWord(String word);

  /// true - если слово есть в избранном пользователя
  Future<Either<String, bool>> getFavouriteWord(String word);

  Future<Either<String, bool>> deleteFavouriteWord(String word);
}

class MockWordsRepositoryImpl implements UserWordsRepository {
  List<String> favourite;
  List<String> history;

  MockWordsRepositoryImpl({
    required this.history,
    required this.favourite,
  });

  @override
  Future<Either<String, bool>> addFavouriteWord(String word) async {
    favourite.add(word);
    return const Right(true);
  }

  @override
  Future<Either<String, bool>> addHistoryWord(String word) async {
    history.add(word);
    return const Right(true);
  }

  @override
  Future<Either<String, bool>> deleteFavouriteWord(String word) async {
    favourite.remove(word);
    return const Right(true);
  }

  @override
  Future<Either<String, bool>> getFavouriteWord(String word) async {
    return Right(favourite.contains(word));
  }

  @override
  Future<Either<String, bool>> getHistoryWord(String word) async {
    return Right(history.contains(word));
  }
}
