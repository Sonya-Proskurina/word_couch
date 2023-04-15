import 'package:word_couch/features/profile/domain/entities/user_entity.dart';

class ProfileState {
  ProfileState._();

  factory ProfileState.noUser() = ProfileNoUserState;

  factory ProfileState.error(String foo) = ProfileErrorState;

  factory ProfileState.loading() = ProfileLoadingState;

  factory ProfileState.user(UserEntity userEntity) = ProfileUserState;
}

class ProfileErrorState extends ProfileState {
  ProfileErrorState(this.msg) : super._();

  final String msg;
}

class ProfileNoUserState extends ProfileState {
  ProfileNoUserState() : super._();
}

class ProfileUserState extends ProfileState {
  ProfileUserState(this.value) : super._();

  final UserEntity value;
}

class ProfileLoadingState extends ProfileState {
  ProfileLoadingState() : super._();
}
