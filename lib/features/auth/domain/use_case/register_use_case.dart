import 'package:egy_film/features/auth/data/firebase/firebase_result.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepo authRepo;
  RegisterUseCase(this.authRepo);

  Future<FirebaseResult<RegisterRequestEntity>> call(RegisterRequestEntity registerRequestEntity) {
    return authRepo.register(registerRequestEntity);
  }
}