import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/core/constants/firebase_const.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';

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

  Future<UserEntity?> getUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? resUser = auth.currentUser;
    if (resUser == null) {
      return null;
    }
    // await firebaseFirestore.clearPersistence();
    final res = firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .where(FirebaseConst.uid, isEqualTo: resUser.uid)
        .snapshots();
    UserEntity? user;
    final result = await res.first;
    final data = result.docs[0].data();
    user = UserEntity(
      email: data[FirebaseConst.email],
      test: data[FirebaseConst.test] as int,
      uid: resUser.uid,
      favourite:
          (data[FirebaseConst.favourite] as List<dynamic>).cast<String>(),
      history: (data[FirebaseConst.history] as List<dynamic>).cast<String>(),
    );
    return user;
  }

  Future exit() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  Future<User?> registration(String email) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    // FirebaseAuth auth = FirebaseAuth.instance;
    // UserCredential userCredential = await auth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    User? user = auth.currentUser;

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
          FirebaseConst.email: email,
          FirebaseConst.history: [],
          FirebaseConst.favourite: [],
        });
      }
    }
    return user;
  }

  Future<void> addFavorite(String word) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) return;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final res = firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .where(FirebaseConst.uid, isEqualTo: user.uid)
        .snapshots();
    final result = await res.first;
    final data = result.docs[0].data();
    List<String> list =
        (data[FirebaseConst.favourite] as List<dynamic>).cast<String>();
    if (list.contains(word)) {
      list.remove(word);
    } else {
      list.add(word);
    }
    firebaseFirestore.collection(FirebaseConst.pathUser).doc(user.uid).update({
      FirebaseConst.favourite: list,
    });
    // await firebaseFirestore.clearPersistence();
  }
}
