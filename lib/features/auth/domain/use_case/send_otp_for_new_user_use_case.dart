import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class SendOtpForNewUserUseCase {
  final AuthRepo authRepo;
  SendOtpForNewUserUseCase(this.authRepo);

  Future<void> call(String email){
    return authRepo.sendOtpForNewUser(email);
  }
}