class UserEntity {
  final String displayName;
  final String email;
  final bool emailVerified;
  final String phoneNumber;
  final String photoURL;
  final String refreshToken;
  final String tenantId;
  final String uid;

  UserEntity({
    required this.displayName,
    required this.email,
    required this.emailVerified,
    required this.photoURL,
    required this.phoneNumber,
    required this.refreshToken,
    required this.tenantId,
    required this.uid,
  });
}
