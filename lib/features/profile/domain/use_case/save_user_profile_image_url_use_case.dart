import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';

class SaveUserProfileImageUrlUseCase {
  final ProfileRepo _profileRepo;
  SaveUserProfileImageUrlUseCase(this._profileRepo);

  Future<void> call(String imageUrl) async {
    await _profileRepo.saveUserProfileImageUrl(imageUrl);
  }
}