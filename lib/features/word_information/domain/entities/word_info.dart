import 'package:word_couch/features/word_information/data/models/image/image_data.dart';
import 'package:word_couch/features/word_information/data/models/word_model.dart';

class WordInfo {
  WordModel? wordInfo;
  ImageData? image;
  WordInfo(this.wordInfo, this.image);
}
