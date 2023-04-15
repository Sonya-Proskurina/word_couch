import 'package:riverpod/riverpod.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'user_states.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState.loading());

  void setError(String msg) {
    state = ProfileState.error(msg);
  }

  void setNoUser() {
    state = ProfileState.noUser();
  }

  void setLoading() {
    state = ProfileState.loading();
  }

  void setUser(UserEntity userEntity) {
    state = ProfileState.user(userEntity);
  }
}
