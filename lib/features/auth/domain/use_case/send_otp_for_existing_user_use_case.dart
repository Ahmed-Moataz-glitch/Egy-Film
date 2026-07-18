import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class SendOtpForExistingUserUseCase {
  final AuthRepo authRepo;
  SendOtpForExistingUserUseCase(this.authRepo);

  Future<void> call(String email){
    return authRepo.sendOtpForExistingUser(email);
  }
}