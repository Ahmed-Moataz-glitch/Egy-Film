import 'dart:io';
import 'package:egy_film/core/utils/secure_storage.dart';
import 'package:egy_film/features/profile/domain/use_case/get_user_info_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/get_user_profile_image_url_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/pick_image_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/save_user_profile_image_url_use_case.dart';
import 'package:egy_film/features/profile/domain/use_case/upload_profile_image_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final PickImageUseCase pickImageUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;
  final UploadProfileImageUseCase uploadProfileImageUseCase;
  final SaveUserProfileImageUrlUseCase saveUserProfileImageUrlUseCase;
  final GetUserProfileImageUrlUseCase getUserProfileImageUrlUseCase;
  ProfileCubit({
    required this.pickImageUseCase,
    required this.getUserInfoUseCase,
    required this.uploadProfileImageUseCase,
    required this.saveUserProfileImageUrlUseCase,
    required this.getUserProfileImageUrlUseCase,
  }) : super(ProfileInitial());

  Future<void> pickImage() async {
    try {
      final image = await pickImageUseCase.call();
      emit(ProfileImagePickedSuccess(image));
    } catch (e) {
      emit(ProfileImagePickedFailure('Failed to pick image: $e'));
    }
  }

  void getUserInfo() {
    final userInfo = getUserInfoUseCase.call();
    emit(ProfileUserInfoLoaded(userInfo));
  }

  Future<void> uploadProfileImage(File imageFile) async {
    emit(UploadingProfileImage());
    try {
      final imageUrl = await uploadProfileImageUseCase.call(imageFile);
      emit(UploadProfileImageSuccess(imageUrl));
    } catch (e) {
      emit(UploadProfileImageFailure('Failed to upload image: $e'));
    }
  }

  Future<void> logout() async {
    emit(Loggingout());
    try {
      await FirebaseAuth.instance.signOut();
      // await Supabase.instance.client.auth.signOut();
      await SecureStorage.deleteToken();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutFailure('Failed to logout: $e'));
    }
  }

  Future<void> saveUserProfileImageUrl(String imageUrl) async {
    try {
      await saveUserProfileImageUrlUseCase.call(imageUrl);
    } catch (e) {
      emit(SaveUserProfileImageUrlFailure('Failed to save image URL: $e'));
    }
  }

  String getUserProfileImageUrl() {
    return getUserProfileImageUrlUseCase.call();
  }
}
