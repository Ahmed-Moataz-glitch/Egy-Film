import 'package:egy_film/features/auth/domain/repo/repo/auth_repo.dart';

class LogoutUseCase {
  final AuthRepo authRepo;
  LogoutUseCase(this.authRepo);

  Future<void> call() {
    return authRepo.logout();
  }
}