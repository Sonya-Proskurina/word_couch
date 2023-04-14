import 'package:firebase_auth/firebase_auth.dart';

class UserAuthDataSource {
  Future<User?> signIn(String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    return user;
  }
}
