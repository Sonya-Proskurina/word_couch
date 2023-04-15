import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/core/constants/firebase_const.dart';

class UserRegistrationDataSource {
  Future<User?> registration(String email, String password) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;

    if (user != null) {
      QuerySnapshot res = await firebaseFirestore
          .collection(FirebaseConst.pathUser)
          .where(FirebaseConst.id, isEqualTo: FirebaseConst.uid)
          .get();
      List<DocumentSnapshot> docs = res.docs;

      if (docs.isEmpty) {
        firebaseFirestore.collection(FirebaseConst.pathUser).doc(user.uid).set({
          FirebaseConst.id: user.uid,
          FirebaseConst.test: 0,
          FirebaseConst.email: user.email,
          FirebaseConst.story: [],
          FirebaseConst.favourite: [],
        });
      }
    }
    return user;
  }
}
