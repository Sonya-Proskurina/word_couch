import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';
import 'package:word_couch/features/profile/presentation/manager/user/challenge_points_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/safe_search_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';
import '../../../domain/entities/user_entity.dart';

class ProfileManager {
  ProfileNotifier notifier;
  UserRepository userRepository;
  SafeSearchNotifier safeSearchNotifier;
  ChallengePointsNotifier challengePointsNotifier;
  bool favoriteMod = false;
  UserEntity? userEntity;
  List<UserWordEntity> words = [];

  ProfileManager({
    required this.notifier,
    required this.userRepository,
    required this.safeSearchNotifier,
    required this.challengePointsNotifier,
  });

  void loading() async {
    notifier.setLoading();
    final res = await userRepository.getUser();
    res.fold((l) => notifier.setError(l), (r) {
      if (r == null) {
        notifier.setNoUser();
      } else {
        userEntity = r;
        if (favoriteMod) {
          words = r.words.where((element) => element.isFavourite).toList();
        } else {
          words = r.words;
        }
        notifier.setUser(r, words.reversed.toList());
      }
    });
  }

  void addFavorite(String word, bool add) async {
    if (userEntity != null) {
      notifier.setLoading();
      final res = await userRepository.addFavorite(word, add);
      res.fold((l) => notifier.setError(l), (r) {
        for (final w in words) {
          if (w.word == word) {
            w.isFavourite = add;
            break;
          }
        }
        if (favoriteMod) {
          notifier.setUser(userEntity!,
              words.where((element) => element.isFavourite).toList());
        } else {
          notifier.setUser(userEntity!, words);
        }
      });
    }
  }

  void addHistory(String word, String description) async {
    if (userEntity != null) {
      notifier.setLoading();
      final res = await userRepository.addHistory(word, description);
      res.fold((l) => notifier.setError(l), (r) {
        if (words.where((element) => element.word == word).isEmpty) {
          words.add(UserWordEntity(
              word: word, isFavourite: false, description: description));
        }
        if (favoriteMod) {
          notifier.setUser(userEntity!,
              words.where((element) => element.isFavourite).toList());
        } else {
          notifier.setUser(userEntity!, words);
        }
      });
    }
  }

  void exit() async {
    notifier.setLoading();
    favoriteMod = false;
    userEntity = null;
    words = [];
    await userRepository.exit();
    notifier.setNoUser();
  }

  void changeFilterMod() async {
    notifier.setLoading();
    favoriteMod = !favoriteMod;
    if (favoriteMod) {
      notifier.setUser(
          userEntity!, words.where((element) => element.isFavourite).toList());
    } else {
      notifier.setUser(userEntity!, words);
    }
  }

  bool get isSafeSearch => safeSearchNotifier.getState();

  void setSafeSearch(bool isSafe) {
    safeSearchNotifier.setState(isSafe);
  }

  int get challengePoints => challengePointsNotifier.getState();

  void addPoints(int points) =>
      challengePointsNotifier.setState(challengePoints + points);

  StateNotifierProvider<ProfileNotifier, ProfileState> getNotifier() {
    return StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
      return notifier;
    });
  }
}
