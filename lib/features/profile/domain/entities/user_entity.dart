class UserEntity {
  final String email;
  final String uid;
  final List<String> favourite;
  final List<String> story;
  final int test;

  UserEntity({
    required this.email,
    required this.uid,
    required this.story,
    required this.favourite,
    required this.test,
  });
}
