import 'dart:io';
import 'package:egy_film/features/profile/data/api/profile_api.dart';
import 'package:egy_film/features/profile/domain/repo/data_source/profile_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDataSourceImpl extends ProfileDataSource {
  final ProfileApi _profileApi;
  ProfileDataSourceImpl(this._profileApi);
  
  @override
  Future<XFile?> pickImage() async {
    return await _profileApi.pickImage();
  }

  @override
  List<UserInfo> getUserInfo() {
    return _profileApi.getUserInfo();
  }

  @override
  Future<String> uploadProfileImage(File imageFile) async {
    return await _profileApi.uploadProfileImage(imageFile);
  }
  
  @override
  Future<void> saveUserProfileImageUrl(String imageUrl) async {
    return await _profileApi.saveUserProfileImageUrl(imageUrl);
  }
  
  @override
  String getUserProfileImageUrl() {
    return _profileApi.getUserProfileImageUrl();
  }
}