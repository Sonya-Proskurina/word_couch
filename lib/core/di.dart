import 'package:riverpod/riverpod.dart';
import 'package:word_couch/features/challenge/data/repositories/challenges_repository.dart';
import 'package:word_couch/features/challenge/domain/use_cases/create_challenge_use_case.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenges_manager.dart';
import 'package:word_couch/features/challenge/presentation/manager/challenges_state_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/challenge_points_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/safe_search_notifier.dart';
import 'package:word_couch/features/word_information/domain/entities/word_info_arg_notifier.dart';
import '../features/word_information/domain/entities/word_info_state.dart';
import 'package:word_couch/core/api_client.dart';
import '../features/word_information/data/repositories/word_info_repository.dart';
import 'package:word_couch/features/profile/data/data_sources/user_auth_data_source.dart';
import 'package:word_couch/features/profile/data/repositories/user_repository_impl.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/auth/auth_states.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_manager.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';
import '../features/word_information/presentation/manager/manager.dart';

class DI {
  static final safeSearch = StateNotifierProvider<SafeSearchNotifier, bool>(
      (ref) => SafeSearchNotifier(true));

  static final challengePoints =
      StateNotifierProvider<ChallengePointsNotifier, int>(
          (ref) => ChallengePointsNotifier(0));

  static final wordInfoNotifier =
      StateNotifierProvider<WordInfoNotifier, WordInfoState>(
          (ref) => WordInfoNotifier());

  static final wordInfoArgNotifier =
      StateNotifierProvider<WordInfoArgNotifier, String>(
          (ref) => WordInfoArgNotifier(""));

  static final wordInfoManager = Provider((ref) => WordInfoManager(
      ref.watch(wordInfoNotifier.notifier),
      ref.watch(wordInfoRepository),
      ref.watch(wordInfoArgNotifier.notifier)));

  static final wordsApiClient = Provider((ref) => WordsApiClient());

  static final imageSearchApiClient =
      Provider((ref) => ImageApiClient(ref.watch(safeSearch.notifier)));

  static final wordInfoRepository = Provider((ref) => WordInfoRepositoryImpl(
      ref.watch(wordsApiClient), ref.watch(imageSearchApiClient)));

  static final userAuthDataSource = Provider((ref) => UserAuthDataSource());

  static final userRepository = Provider(
    (ref) => UserRepositoryImpl(
      userAuthDataSource: ref.watch(userAuthDataSource),
      wordInfoRepositoryImpl: ref.watch(wordInfoRepository),
    ),
  );

  static final profileNotifier =
      StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
    return ProfileNotifier();
  });

  static final profileManager = Provider((ref) => ProfileManager(
      notifier: ref.watch(profileNotifier.notifier),
      userRepository: ref.watch(userRepository),
      safeSearchNotifier: ref.watch(safeSearch.notifier),
      challengePointsNotifier: ref.watch(challengePoints.notifier)));

  static final authNotifier =
      StateNotifierProvider<AuthNotifier, AuthState>((ref) {
    return AuthNotifier();
  });

  static final authManager = Provider((ref) => AuthManager(
      notifier: ref.watch(authNotifier.notifier),
      userRepository: ref.watch(userRepository)));

  static final challengesNotifier =
      StateNotifierProvider((ref) => ChallengeStateNotifier());

  static final challengesManager = Provider((ref) => ChallengesManager(
      ref.watch(challengesNotifier.notifier),
      ref.watch(createChallengeProvider)));

  static final searchBarInFocusStateProvider =
      StateProvider<bool>((ref) => false);

  static final createChallengeProvider =
      Provider<CreateChallengeUseCase>((ref) {
    return CreateChallengeUseCase(ChallengesRepositoryImpl(),
        antonymsAmount: 0, synonymsAmount: 0);
  });

  static final questionsDatabaseLoadedStateProvider =
      StateProvider<bool>((ref) => false);
}
