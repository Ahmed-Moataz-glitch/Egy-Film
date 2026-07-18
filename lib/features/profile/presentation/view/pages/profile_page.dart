import 'dart:io';
import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_dialogs.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/core/utils/app_toast.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/features/profile/presentation/view/widgets/drop_down_button_widget.dart';
import 'package:egy_film/features/profile/presentation/view_model/profile_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit profileCubit;
  File? imageFile;
  String? userProfileImageUrl;
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
    profileCubit = getIt<ProfileCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      profileCubit.getUserInfo();
      _loadImage();
      debugPrint('userProfileImageUrl: $userProfileImageUrl');
    });
  }

  void _loadImage() {
    setState(() {
      userProfileImageUrl = profileCubit.getUserProfileImageUrl();
      key = UniqueKey(); // Update the key to force rebuild
    });
  }

  @override
  void dispose() {
    profileCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: size.width),
              Text(
                S.of(context).profile_page_title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.fillColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.06),
              BlocConsumer<ProfileCubit, ProfileState>(
                bloc: profileCubit,
                listenWhen: (previous, current) =>
                    current is ProfileImagePickedFailure,
                buildWhen: (previous, current) =>
                    current is ProfileImagePickedSuccess,
                listener: (context, state) {
                  if (state is ProfileImagePickedFailure) {
                    AppToast.showToast(
                      context: context,
                      title: S.of(context).app_toast_error,
                      description: state.errorMessage,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is ProfileImagePickedSuccess) {
                    imageFile = state.pickedImage != null
                        ? File(state.pickedImage!.path)
                        : null;
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: size.width * 0.53,
                          height: size.width * 0.53,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [AppColors.red, AppColors.blue],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: size.width * 0.25,
                          backgroundColor: AppColors.gray,
                          backgroundImage: FileImage(
                            File(state.pickedImage!.path),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () async {
                              await profileCubit.pickImage();
                            },
                            child: CircleAvatar(
                              radius: size.width * 0.05,
                              backgroundColor: AppColors.yellow,
                              child: Icon(
                                Icons.edit,
                                color: AppColors.dark,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: size.width * 0.53,
                        height: size.width * 0.53,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [AppColors.red, AppColors.blue],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: size.width * 0.25,
                        backgroundColor: AppColors.gray,
                        backgroundImage: imageFile != null
                            ? FileImage(imageFile!)
                            : userProfileImageUrl != null &&
                                  userProfileImageUrl!.isNotEmpty
                            ? NetworkImage(userProfileImageUrl!)
                            : AssetImage(AppAssets.defaultUserProfileImage),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: GestureDetector(
                          onTap: () async {
                            await profileCubit.pickImage();
                          },
                          child: CircleAvatar(
                            radius: size.width * 0.05,
                            backgroundColor: AppColors.yellow,
                            child: Icon(
                              Icons.edit,
                              color: AppColors.dark,
                              size: 24.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: size.height * 0.04),
              BlocBuilder<ProfileCubit, ProfileState>(
                bloc: profileCubit,
                buildWhen: (previous, current) =>
                    current is ProfileUserInfoLoaded,
                builder: (context, state) {
                  if (state is ProfileUserInfoLoaded) {
                    final userInfo = state.userInfo;
                    return Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.yellow, width: 1.r),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        spacing: 16.h,
                        children: [
                          Text(
                            userInfo.isNotEmpty
                                ? userInfo.first.email!
                                : S.of(context).no_email,
                            style: TextStyle(
                              color: AppColors.yellow,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                spacing: 8.w,
                                children: [
                                  Icon(
                                    Icons.language,
                                    color: AppColors.fillColor,
                                    size: 36.sp,
                                  ),
                                  Text(
                                    S.of(context).profile_page_title4,
                                    style: TextStyle(
                                      color: AppColors.fillColor.withAlpha(240),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              SizedBox(
                                width: size.width * 0.2,
                                child: DropDownButtonWidget(),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.01),
                          BlocConsumer<ProfileCubit, ProfileState>(
                            bloc: profileCubit,
                            listenWhen: (previous, current) =>
                                current is UploadingProfileImage ||
                                current is UploadProfileImageSuccess ||
                                current is UploadProfileImageFailure,
                            buildWhen: (previous, current) =>
                                current is ProfileImagePickedSuccess,
                            listener: (context, state) {
                              if (state is UploadingProfileImage) {
                                AppDialogs.showLoadingDialog(
                                  context,
                                  title: S
                                      .of(context)
                                      .profile_page_update_profile_image_loading,
                                );
                              }
                              if (state is UploadProfileImageSuccess) {
                                userProfileImageUrl = state.imageUrl;
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(); // Close the loading dialog
                                AppDialogs.showSnackBar(
                                  context: context,
                                  message: S
                                      .of(context)
                                      .profile_page_update_profile_image_success,
                                );
                              }
                              if (state is UploadProfileImageFailure) {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(); // Close the loading dialog
                                AppDialogs.showSnackBar(
                                  context: context,
                                  message: state.errorMessage,
                                  isError: true,
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is ProfileImagePickedSuccess) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: MainButtonWidget(
                                        title: S
                                            .of(context)
                                            .profile_page_title3,
                                        onPressed: () async {
                                          await profileCubit.uploadProfileImage(
                                            imageFile!,
                                          );
                                          await profileCubit
                                              .saveUserProfileImageUrl(
                                                userProfileImageUrl!,
                                              );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              }
                              return Row(
                                children: [
                                  Expanded(
                                    child: MainButtonWidget(
                                      title: S.of(context).profile_page_title3,
                                      onPressed: null,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          BlocListener<ProfileCubit, ProfileState>(
                            bloc: profileCubit,
                            listenWhen: (previous, current) =>
                                current is Loggingout ||
                                current is LogoutSuccess ||
                                current is LogoutFailure,
                            listener: (context, state) {
                              if (state is Loggingout) {
                                AppDialogs.showLoadingDialog(
                                  context,
                                  title: S
                                      .of(context)
                                      .profile_page_logout_loading,
                                );
                              }
                              if (state is LogoutSuccess) {
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pop(); // Close the loading dialog
                                Navigator.of(
                                  context,
                                  rootNavigator: true,
                                ).pushNamedAndRemoveUntil(
                                  AppRoutes.login,
                                  (route) => false,
                                );
                              }
                              if (state is LogoutFailure) {
                                AppToast.showToast(
                                  context: context,
                                  title: S.of(context).app_toast_error,
                                  description: state.errorMessage,
                                  type: ToastificationType.error,
                                );
                              }
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: MainButtonWidget(
                                    title: S.of(context).profile_page_logout,
                                    onPressed: () async {
                                      await profileCubit.logout();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
