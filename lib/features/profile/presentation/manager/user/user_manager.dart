import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    var res = await userRepository.getUser();
    // await Future.delayed(Duration(seconds: 3));
    res.fold(
      (l) => notifier.setError(l),
      (r) {
        if (r != null) {
          notifier.setUser(r);
        } else {
          notifier.setNoUser();
        }
      },
    );
  }

  StateNotifierProvider<ProfileNotifier, ProfileState> getNotifier() {
    return StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
      return notifier;
    });
  }
}
