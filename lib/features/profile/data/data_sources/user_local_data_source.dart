import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:word_couch/core/constants/local_constants.dart';

class UserLocalDataSource {
  final FlutterSecureStorage storage;

  UserLocalDataSource({
    required this.storage,
  });

  void addUser(String uid) async {
    await storage.write(key: LocalConstants.user, value: uid);
  }

  Future<String?> getUser() async {
    final res = await storage.read(key: LocalConstants.user);
    return res;
  }
}
