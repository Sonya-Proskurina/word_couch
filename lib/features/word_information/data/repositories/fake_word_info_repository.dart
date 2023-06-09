import 'package:dartz/dartz.dart';
import 'package:word_couch/features/word_information/data/models/image/image_data.dart';

import '../../domain/repositories/word_info_repository.dart';
import '../models/word_model.dart';

class FakeWordInfoRepository implements WordInfoRepository {
  Future<Either<String, WordModel>> getWordInfo(String word) async {
    var res = WordModel.fromJson({
      "word": "car",
      "results": [
        {
          "definition":
              "a motor vehicle with four wheels; usually propelled by an internal combustion engine",
          "partOfSpeech": "noun",
          "synonyms": ["auto", "automobile", "machine", "motorcar"],
          "hasCategories": [
            "traction",
            "spark lever",
            "showroom",
            "salesroom",
            "saleroom",
            "backseat",
            "road map",
            "adhesive friction",
            "prang",
            "rider",
            "renting",
            "rental",
            "personal chattel",
            "tunnel",
            "alternator",
            "passenger",
            "movable",
            "grip",
            "chattel",
            "hopped-up"
          ],
          "typeOf": ["automotive vehicle", "motor vehicle"],
          "hasTypes": [
            "cruiser",
            "ambulance",
            "beach waggon",
            "beach wagon",
            "bus",
            "cab",
            "compact",
            "compact car",
            "convertible",
            "coupe",
            "electric",
            "electric automobile",
            "electric car",
            "estate car",
            "gas guzzler",
            "hack",
            "hardtop",
            "hatchback",
            "heap",
            "horseless carriage",
            "hot-rod",
            "hot rod",
            "jalopy",
            "jeep",
            "landrover",
            "limo",
            "limousine",
            "loaner",
            "minicar",
            "minivan",
            "model t",
            "pace car",
            "patrol car",
            "phaeton",
            "police car",
            "police cruiser",
            "prowl car",
            "race car",
            "racer",
            "racing car",
            "roadster",
            "runabout",
            "s.u.v.",
            "saloon",
            "secondhand car",
            "sedan",
            "sport car",
            "sport utility",
            "sport utility vehicle",
            "sports car",
            "squad car",
            "stanley steamer",
            "station waggon",
            "station wagon",
            "stock car",
            "subcompact",
            "subcompact car",
            "suv",
            "taxi",
            "taxicab",
            "tourer",
            "touring car",
            "two-seater",
            "used-car",
            "waggon",
            "wagon"
          ],
          "hasParts": [
            "low gear",
            "first gear",
            "floorboard",
            "car seat",
            "car mirror",
            "gas",
            "running board",
            "gas pedal",
            "gasoline engine",
            "glove compartment",
            "grille",
            "car horn",
            "gun",
            "tail fin",
            "automobile trunk",
            "automobile horn",
            "tailfin",
            "high",
            "high gear",
            "hood",
            "hooter",
            "horn",
            "air bag",
            "automobile engine",
            "auto accessory",
            "third",
            "third gear",
            "low",
            "luggage compartment",
            "throttle",
            "accelerator pedal",
            "stabilizer bar",
            "motor horn",
            "car door",
            "anti-sway bar",
            "bumper",
            "petrol engine",
            "trunk",
            "window",
            "sunroof",
            "sunshine-roof",
            "radiator grille",
            "rear window",
            "buffer",
            "boot",
            "reverse",
            "car window",
            "reverse gear",
            "bonnet",
            "cowl",
            "cowling",
            "accelerator",
            "roof",
            "wing",
            "fender",
            "fin",
            "first"
          ],
          "examples": ["he needs a car to get to work"]
        },
        {
          "definition":
              "the compartment that is suspended from an airship and that carries personnel and the cargo and the power plant",
          "partOfSpeech": "noun",
          "synonyms": ["gondola"],
          "typeOf": ["compartment"],
          "partOf": ["dirigible", "airship"]
        },
        {
          "definition": "where passengers ride up and down",
          "partOfSpeech": "noun",
          "synonyms": ["elevator car"],
          "typeOf": ["compartment"],
          "partOf": ["elevator", "lift"],
          "examples": ["the car was on the top floor"]
        },
        {
          "definition": "a wheeled vehicle adapted to the rails of railroad",
          "partOfSpeech": "noun",
          "synonyms": ["railcar", "railroad car", "railway car"],
          "typeOf": ["wheeled vehicle"],
          "hasTypes": [
            "mail car",
            "guard's van",
            "tender",
            "luggage van",
            "passenger car",
            "handcar",
            "slip coach",
            "lounge car",
            "van",
            "freight car",
            "baggage car",
            "carriage",
            "club car",
            "coach",
            "slip carriage",
            "caboose",
            "cabin car"
          ],
          "memberOf": ["railroad train", "train"],
          "hasParts": ["suspension system", "suspension"],
          "examples": ["three cars had jumped the rails"]
        },
        {
          "definition":
              "a conveyance for passengers or freight on a cable railway",
          "partOfSpeech": "noun",
          "synonyms": ["cable car"],
          "typeOf": ["compartment"],
          "partOf": ["cable railway", "funicular", "funicular railway"],
          "examples": ["they took a cable car to the top of the mountain"]
        }
      ],
      "syllables": {
        "count": 1,
        "list": ["car"]
      },
      "pronunciation": {"all": "kɑr"},
      "frequency": 5.68
    });
    return Right(res);
  }

  @override
  Future<Either<String, ImageData>> getWordImage(String word) async {
    return Right(ImageData(webSearchUrl: '', value: [
      Value(
          webSearchUrl: '',
          name: '',
          thumbnailUrl:
              'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
          datePublished: DateTime.now(),
          contentUrl:
              'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
          encodingFormat: '',
          width: 0,
          height: 0,
          thumbnail: const Thumbnail(width: 0, height: 0),
          accentColor: '')
    ]));
  }

  @override
  Future<Either<String, WordModel>> getRandomWord() {
    throw UnimplementedError();
  }
}
