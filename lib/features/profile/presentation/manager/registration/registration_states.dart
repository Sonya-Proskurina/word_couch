class RegistrationState {
  RegistrationState._();

  factory RegistrationState.error(String foo) = RegistrationErrorState;

  factory RegistrationState.loading() = RegistrationLoadingState;

  factory RegistrationState.loaded() = RegistrationLoadedState;

  factory RegistrationState.user() = RegistrationUserState;
}

class RegistrationErrorState extends RegistrationState {
  RegistrationErrorState(this.msg) : super._();

  final String msg;
}

class RegistrationLoadedState extends RegistrationState {
  RegistrationLoadedState() : super._();
}

class RegistrationLoadingState extends RegistrationState {
  RegistrationLoadingState() : super._();
}

class RegistrationUserState extends RegistrationState {
  RegistrationUserState() : super._();
}