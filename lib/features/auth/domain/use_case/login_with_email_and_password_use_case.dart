import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginWithEmailAndPasswordUseCase {
  final AuthRepo authRepo;
  LoginWithEmailAndPasswordUseCase(this.authRepo);

  Future<FirebaseResult<UserCredential>> call(LoginRequestEntity loginRequestEntity) {
    return authRepo.loginWithEmailAndPassword(loginRequestEntity);
  }
}