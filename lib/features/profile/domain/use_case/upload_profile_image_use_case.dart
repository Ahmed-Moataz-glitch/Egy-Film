import 'dart:io';
import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';

class UploadProfileImageUseCase {
  final ProfileRepo profileRepo;
  UploadProfileImageUseCase(this.profileRepo);

  Future<String> call(File imageFile) {
    return profileRepo.uploadProfileImage(imageFile);
  }
}