import 'package:dartz/dartz.dart';
import 'package:word_couch/features/word_information/data/models/image/image_data.dart';

import '../../data/models/word_model.dart';

mixin WordInfoRepository {
  Future<Either<String, WordModel>> getRandomWord();
  Future<Either<String, WordModel>> getWordInfo(String word);
  Future<Either<String, ImageData>> getWordImage(String word);
}