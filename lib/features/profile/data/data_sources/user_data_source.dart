import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:word_couch/core/constants/firebase_const.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';

class UserAuthDataSource {
  Future<UserEntity?> getUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? resUser = auth.currentUser;
    if (resUser == null) {
      return null;
    }

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final res = firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .where(FirebaseConst.uid, isEqualTo: resUser.uid)
        .snapshots();
    UserEntity? user;
    final result = await res.first;
    final data = result.docs[0].data();

    final resWords = firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .doc(resUser.uid)
        .collection(FirebaseConst.pathWord)
        .snapshots();
    final resultWord = await resWords.first;

    List<UserWordEntity> words = [];
    for (final word in resultWord.docs) {
      words.add(
        UserWordEntity(
          word: word[FirebaseConst.title],
          isFavourite: word[FirebaseConst.isFavourite] as bool,
          description: word[FirebaseConst.description],
        ),
      );
    }

    user = UserEntity(
      email: data[FirebaseConst.email],
      test: data[FirebaseConst.test] as int,
      uid: resUser.uid,
      words: words,
    );
    return user;
  }

  /// Вызывается после добавления юзера в Authentication
  Future<User?> registration(String email) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      QuerySnapshot res = await firebaseFirestore
          .collection(FirebaseConst.pathUser)
          .where(FirebaseConst.uid, isEqualTo: FirebaseConst.uid)
          .get();
      if (res.docs.isEmpty) {
        firebaseFirestore.collection(FirebaseConst.pathUser).doc(user.uid).set({
          FirebaseConst.uid: user.uid,
          FirebaseConst.test: 0,
          FirebaseConst.email: email,
        });
      }
    }
    return user;
  }

  Future<void> changeFavorite(String word, bool add) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) return;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .doc(user.uid)
        .collection(FirebaseConst.pathWord)
        .doc(word)
        .set({
      FirebaseConst.isFavourite: add,
    }, SetOptions(merge: true));
  }

  Future<void> addHistory(String word, String description) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user == null) return;
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    firebaseFirestore
        .collection(FirebaseConst.pathUser)
        .doc(user.uid)
        .collection(FirebaseConst.pathWord)
        .doc(word)
        .set({
      FirebaseConst.title: word,
      FirebaseConst.description: description,
      FirebaseConst.isFavourite: false,
    });
  }

  Future exit() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }
}
