import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserTransformer {
  static UserEntity getEntity(User user) {
    return UserEntity(
      displayName: user.displayName ?? "",
      email: user.email ?? "",
      emailVerified: user.emailVerified,
      photoURL: user.photoURL ?? "",
      phoneNumber: user.phoneNumber ?? "",
      refreshToken: user.refreshToken ?? "",
      tenantId: user.tenantId ?? "",
      uid: user.uid,
    );
  }
}
