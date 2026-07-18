import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class LoginWithGoogleUseCase {
  final AuthRepo authRepo;
  LoginWithGoogleUseCase(this.authRepo);

  Future<bool> call(){
    return authRepo.loginWithGoogle();
  }
}