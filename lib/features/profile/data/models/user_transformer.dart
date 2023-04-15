import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class UserTransformer {
  static UserEntity getEntity(User user) {
    return UserEntity(
      email: user.email ?? "",
      uid: user.uid,
      favourite: [],
      story: [],
      test: 0,
    );
  }
}
