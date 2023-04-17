import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_couch/features/profile/domain/entities/user_word_entity.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_notifier.dart';
import 'package:word_couch/features/profile/presentation/manager/user/user_states.dart';

class ProfileManager {
  ProfileNotifier notifier;
  UserRepository userRepository;

  ProfileManager({
    required this.notifier,
    required this.userRepository,
  });

  void loading() async {
    notifier.setLoading();
    List<UserWordEntity> list = [];
    final resHistory = await userRepository.getWordsHistory();
    resHistory.fold((l) => notifier.setError(l), (r) => list = r);
    final res = await userRepository.getUser();
    res.fold(
      (l) => notifier.setError(l),
      (r) {
        if (r != null) {
          notifier.setUser(r, list);
        } else {
          notifier.setNoUser();
        }
      },
    );
  }

  void addFavorite(String word) async {
    notifier.setLoading();
    List<UserWordEntity> list = [];
    final resAddWord = await userRepository.addFavorite(word);
    resAddWord.fold((l) => notifier.setError(l), (r) {});
    final resHistory = await userRepository.getWordsHistory();
    resHistory.fold((l) => notifier.setError(l), (r) => list = r);
    final res = await userRepository.getUser();
    res.fold(
      (l) => notifier.setError(l),
      (r) {
        if (r != null) {
          notifier.setUser(r, list);
        } else {
          notifier.setNoUser();
        }
      },
    );
  }

  void exit() async {
    notifier.setLoading();
    await userRepository.exit();
    notifier.setNoUser();
  }

  StateNotifierProvider<ProfileNotifier, ProfileState> getNotifier() {
    return StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
      return notifier;
    });
  }
}
