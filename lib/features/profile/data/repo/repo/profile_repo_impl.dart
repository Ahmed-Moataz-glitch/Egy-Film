import 'dart:io';
import 'package:egy_film/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:egy_film/features/profile/domain/repo/repo/profile_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource _profileDataSource;
  ProfileRepoImpl(this._profileDataSource);

  @override
  Future<XFile?> pickImage() {
    return _profileDataSource.pickImage();
  }

  @override
  List<UserInfo> getUserInfo() {
    return _profileDataSource.getUserInfo();
  }

  @override
  Future<String> uploadProfileImage(File imageFile) async {
    return await _profileDataSource.uploadProfileImage(imageFile);
  }
  
  @override
  Future<void> saveUserProfileImageUrl(String imageUrl) async {
    return await _profileDataSource.saveUserProfileImageUrl(imageUrl);
  }
  
  @override
  String getUserProfileImageUrl() {
    return _profileDataSource.getUserProfileImageUrl();
  }
}
