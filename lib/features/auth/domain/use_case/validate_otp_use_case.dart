import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class ValidateOtpUseCase {
  final AuthRepo authRepo;
  ValidateOtpUseCase(this.authRepo);

  Future<bool> call({required String email, required String otp}) {
    return authRepo.validateOtp(email: email, otp: otp);
  }
}