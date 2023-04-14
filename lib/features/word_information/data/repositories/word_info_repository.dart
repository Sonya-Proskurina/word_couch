import 'package:dartz/dartz.dart';
import 'package:word_couch/core/logger.dart';

import '../../../../core/api_client.dart';
import '../models/word_model.dart';

class WordInfoRepositoryImpl {
  static const String _wordInfoUrl = '/words/';

  static Future<Either<String, WordModel>> getWordInfo(String word) async {
    try {
      var res = WordModel.fromJson(await ApiClient.get(_wordInfoUrl + word));
      return Right(res);
    } catch (e) {
      logger.e(e);
      return Left('Error getting word info: $e');
    }
  }
}
