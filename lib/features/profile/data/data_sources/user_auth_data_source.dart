import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/core/constants/firebase_const.dart';
import 'package:word_couch/core/logger.dart';
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

  Future<UserEntity?> getUser(String uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    final res = firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .where(FirebaseConst.uid, isEqualTo: uid)
        .snapshots();
    UserEntity? user;
    final result = await res.first;
    final res2 = result.docs[0].data();
    user = UserEntity(
      email: res2[FirebaseConst.email],
      test: res2[FirebaseConst.test] as int,
      uid: uid,
      favourite:
          (res2[FirebaseConst.favourite] as List<dynamic>).cast<String>(),
      story: (res2[FirebaseConst.story] as List<dynamic>).cast<String>(),
    );
    logger.e(res2[FirebaseConst.email]);
    logger.e(res2[FirebaseConst.favourite]);
    logger.e(res2[FirebaseConst.uid]);
    logger.e(res2[FirebaseConst.story]);
    logger.e(res2[FirebaseConst.test]);
    return user;
  }
}
