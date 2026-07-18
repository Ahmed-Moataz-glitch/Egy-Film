import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepo {
  Future<XFile?> pickImage();

  List<UserInfo> getUserInfo();

  Future<String> uploadProfileImage(File imageFile);

  Future<void> saveUserProfileImageUrl(String imageUrl);

  String getUserProfileImageUrl();
}
