import 'package:dartz/dartz.dart';
import 'package:word_couch/features/profile/domain/entities/user_entity.dart';
import 'package:word_couch/features/profile/domain/repositories/user_repository.dart';

class SignInUseCase {
  UserRepository userRepository;

  SignInUseCase({required this.userRepository});

  Future<Either<String, UserEntity>> call(String email, String password) {
    return userRepository.signIn(email, password);
  }
}
