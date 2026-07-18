part of 'profile_cubit.dart';

sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileImagePickedSuccess extends ProfileState {
  final XFile? pickedImage;
  ProfileImagePickedSuccess(this.pickedImage);
}

final class ProfileUserInfoLoaded extends ProfileState {
  final List<UserInfo> userInfo;
  ProfileUserInfoLoaded(this.userInfo);
}

final class ProfileImagePickedFailure extends ProfileState {
  final String errorMessage;
  ProfileImagePickedFailure(this.errorMessage);
}

final class UploadingProfileImage extends ProfileState {}

final class UploadProfileImageSuccess extends ProfileState {
  final String imageUrl;
  UploadProfileImageSuccess(this.imageUrl);
}

final class UploadProfileImageFailure extends ProfileState {
  final String errorMessage;
  UploadProfileImageFailure(this.errorMessage);
}

final class SaveUserProfileImageUrlFailure extends ProfileState {
  final String errorMessage;
  SaveUserProfileImageUrlFailure(this.errorMessage);
}

final class Loggingout extends ProfileState {}

final class LogoutSuccess extends ProfileState {}

final class LogoutFailure extends ProfileState {
  final String errorMessage;
  LogoutFailure(this.errorMessage);
}