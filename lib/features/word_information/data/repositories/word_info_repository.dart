import 'package:dartz/dartz.dart';
import 'package:word_couch/core/logger.dart';
import 'package:word_couch/features/word_information/data/models/image/image_data.dart';

import '../../../../core/api_client.dart';
import '../../domain/repositories/word_info_repository.dart';
import '../models/word_model.dart';

class WordInfoRepositoryImpl implements WordInfoRepository {
  WordsApiClient _wordsApiClient;
  ImageApiClient _imageApiClient;
  WordInfoRepositoryImpl(this._wordsApiClient, this._imageApiClient);

  static const String _wordInfoUrl = '/words/';

  Future<Either<String, WordModel>> getWordInfo(String word) async {
    try {
      var res = WordModel.fromJson(await _wordsApiClient.get(_wordInfoUrl + word));
      return Right(res);
    } catch (e) {
      logger.e(e);
      return Left('Error getting word info: $e');
    }
  }

  @override
  Future<Either<String, ImageData>> getWordImage(String word) async {
    try {
      var res = ImageData.fromJson(await _imageApiClient.get(_wordInfoUrl + word));
    return Right(res);
    } catch (e) {
    logger.e(e);
    return Left('Error getting word image: $e');
    }
  }
}
