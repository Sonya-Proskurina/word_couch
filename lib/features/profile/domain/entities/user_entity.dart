class UserEntity {
  final String email;
  final String uid;
  final List<String> favourite;
  final List<String> history;
  final int test;

  UserEntity({
    required this.email,
    required this.uid,
    required this.history,
    required this.favourite,
    required this.test,
  });
}
