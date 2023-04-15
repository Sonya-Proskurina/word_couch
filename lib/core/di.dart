import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod/riverpod.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/data/data_sources/user_local_data_source.dart';
import 'package:word_couch/features/profile/data/data_sources/user_registration_data_source.dart';
import 'package:word_couch/features/profile/data/repositories/user_repository_impl.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_states.dart';
import 'package:word_couch/features/profile/presentation/manager/registration/registration_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/registration/registration_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/registration/registration_states.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';
import '../features/word_information/domain/manager/manager.dart';

class DI {
  static final wordInfoNotifier =
      StateNotifierProvider((ref) => WordInfoNotifier());

  static final wordInfoManager =
      Provider((ref) => WordInfoManager(ref.watch(wordInfoNotifier.notifier)));

  static final userAuthDataSource = Provider((ref) => UserAuthDataSource());

  static final userRegistrationDataSource =
      Provider((ref) => UserRegistrationDataSource());

  static final androidOptions = Provider((ref) => const AndroidOptions(
        encryptedSharedPreferences: true,
      ));

  static final secureStorage = Provider(
      (ref) => FlutterSecureStorage(aOptions: ref.watch(androidOptions)));

  static final userLocalDataSource =
      Provider((ref) => UserLocalDataSource(storage: ref.watch(secureStorage)));

  static final userRepository = Provider(
    (ref) => UserRepositoryImpl(
      userAuthDataSource: ref.watch(userAuthDataSource),
      userLocalDataSource: ref.watch(userLocalDataSource),
      userRegistrationDataSource: ref.watch(userRegistrationDataSource),
    ),
  );

  static final profileNotifier =
      StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
    return ProfileNotifier();
  });

  static final profileManager = Provider((ref) => ProfileManager(
      notifier: ref.watch(profileNotifier.notifier),
      userRepository: ref.watch(userRepository)));

  static final authNotifier =
      StateNotifierProvider<AuthNotifier, AuthState>((ref) {
    return AuthNotifier();
  });

  static final registrationNotifier =
      StateNotifierProvider<RegistrationNotifier, RegistrationState>((ref) {
    return RegistrationNotifier();
  });

  static final registrationManager = Provider((ref) => RegistrationManager(
      notifier: ref.watch(registrationNotifier.notifier),
      userRepository: ref.watch(userRepository)));

  static final authManager = Provider((ref) => AuthManager(
      notifier: ref.watch(authNotifier.notifier),
      userRepository: ref.watch(userRepository)));
}
