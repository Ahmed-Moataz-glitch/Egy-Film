import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo authRepo;
  ResetPasswordUseCase(this.authRepo);

  Future<FirebaseResult<void>> call(RegisterRequestEntity registerRequestEntity) {
    return authRepo.resetPassword(registerRequestEntity);
  }
}