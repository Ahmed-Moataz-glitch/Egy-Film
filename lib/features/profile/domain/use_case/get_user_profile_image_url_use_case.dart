import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';

class GetUserProfileImageUrlUseCase {
  final ProfileRepo profileRepo;
  GetUserProfileImageUrlUseCase(this.profileRepo);

  String call() {
    return profileRepo.getUserProfileImageUrl();
  }
}