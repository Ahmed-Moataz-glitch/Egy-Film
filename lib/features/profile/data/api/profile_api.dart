import 'dart:io';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/features/profile/data/model/user_profile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;

class ProfileApi {
  final ImagePicker _imagePicker = ImagePicker();
  final User? user = FirebaseAuth.instance.currentUser;
  final supabase = Supabase.instance.client;

  Future<XFile?> pickImage() async {
    return await _imagePicker.pickImage(source: ImageSource.gallery);
  }

  List<UserInfo> getUserInfo() {
    return user?.providerData ?? [];
  }

  Future<String> uploadProfileImage(File imageFile) async {
    if (supabase.auth.currentSession == null) {
      await supabase.auth.signInAnonymously();
    }
    final fileExtension = imageFile.path.split('.').last;
    final path =
        'Profile/${supabase.auth.currentUser?.id}/avatar.$fileExtension';
    await supabase.storage
        .from(AppConstants.supabaseStorageBucket)
        .upload(
          path,
          imageFile,
          fileOptions: FileOptions(
            upsert: true, // overwrite if exists
            cacheControl: '0', // helps avoid stale cached image
          ),
        );
    debugPrint('session: ${supabase.auth.currentSession}');
    return supabase.storage
        .from(AppConstants.supabaseStorageBucket)
        .createSignedUrl(path, 60 * 60 * 24 * 30); // URL valid for 30 days
  }

  Future<void> saveUserProfileImageUrl(String imageUrl) async {
    final userProfileBox = Hive.box<UserProfileModel>(
      AppConstants.userProfileBox,
    );
    Uri.encodeFull(imageUrl);
    await userProfileBox.put(
      user?.uid,
      UserProfileModel(userProfileImageUrl: imageUrl),
    );
  }

  String getUserProfileImageUrl() {
    final userProfileBox = Hive.box<UserProfileModel>(
      AppConstants.userProfileBox,
    );
    return userProfileBox.get(user?.uid)?.userProfileImageUrl ?? '';
  }
}
