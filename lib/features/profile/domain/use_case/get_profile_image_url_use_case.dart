import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';

class GetProfileImageUrlUseCase {
  final ProfileRepo profileRepo;
  GetProfileImageUrlUseCase(this.profileRepo);

  String call() {
    return profileRepo.getUserProfileImageUrl();
  }
}