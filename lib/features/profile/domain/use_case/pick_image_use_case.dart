import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

class PickImageUseCase {
  final ProfileRepo profileRepo;
  PickImageUseCase(this.profileRepo);

  Future<XFile?> call(){
    return profileRepo.pickImage();
  }
}