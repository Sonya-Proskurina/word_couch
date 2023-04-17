class UserWordEntity {
  String word;
  String description;
  bool isHistory;
  bool isFavourite;

  UserWordEntity({
    required this.word,
    required this.isFavourite,
    required this.isHistory,
    required this.description,
  });
}
