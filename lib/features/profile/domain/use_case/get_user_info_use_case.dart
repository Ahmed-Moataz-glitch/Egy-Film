import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetUserInfoUseCase {
  final ProfileRepo profileRepo;
  GetUserInfoUseCase(this.profileRepo);

  List<UserInfo> call() {
    return profileRepo.getUserInfo();
  }
}