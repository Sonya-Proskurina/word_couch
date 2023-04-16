class AuthState {
  AuthState._();

  factory AuthState.error(String foo) = AuthErrorState;

  factory AuthState.loading() = AuthLoadingState;

  factory AuthState.loaded() = AuthLoadedState;

  factory AuthState.user() = AuthUserState;

  factory AuthState.registration() = AuthRegistrationState;
}

class AuthErrorState extends AuthState {
  AuthErrorState(this.msg) : super._();

  final String msg;
}

class AuthLoadedState extends AuthState {
  AuthLoadedState() : super._();
}

class AuthLoadingState extends AuthState {
  AuthLoadingState() : super._();
}

class AuthUserState extends AuthState {
  AuthUserState() : super._();
}

class AuthRegistrationState extends AuthState {
  AuthRegistrationState() : super._();
}
