// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_dialogs.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/core/utils/app_toast.dart';
import 'package:egy_film/features/auth/domain/entities/register/register_request_entity.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/validator.dart';
import 'package:egy_film/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class RegisterPage extends StatefulWidget {
  final AuthCubit authCubit;
  const RegisterPage({super.key, required this.authCubit});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController fullNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late bool isTermsAccepted;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isTermsAccepted = false;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      body: BlocListener<AuthCubit, AuthState>(
        bloc: widget.authCubit,
        listenWhen: (previous, current) =>
            current is AuthLoading ||
            current is AuthSuccess ||
            current is AuthError,
        listener: (context, state) {
          if (state is AuthLoading) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).register_page_loading);
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is AuthError) {
            AppToast.showToast(
              context: context,
              title: S.of(context).app_toast_error,
              description: state.message,
              type: ToastificationType.error,
            );
          }
          if (state is AuthSuccess) {
            Navigator.of(context, rootNavigator: true).pushNamed(
              AppRoutes.verifyEmail,
              arguments: {
                'email': emailController.text.trim(),
                'authCubit': widget.authCubit,
              },
            );
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(
              right: 16.w,
              left: 16.w,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        AppAssets.egyFilm2Image,
                        width: size.width * 0.4,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  S.of(context).register_page_title1,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).register_page_title2,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: fullNameController,
                        validator: Validator.validateName,
                        hintText: S.of(context).register_page_title2_hint_text,
                        isFullName: true,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        S.of(context).register_page_title3,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: emailController,
                        validator: Validator.validateEmail,
                        hintText: S.of(context).register_page_title3_hint_text,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        S.of(context).register_page_title4,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextFormFieldWidget(
                        controller: passwordController,
                        validator: Validator.validatePassword,
                        hintText: S.of(context).register_page_title4_hint_text,
                        isPassword: true,
                        obscureText: true,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Row(
                          spacing: 8.w,
                          children: [
                            SizedBox(
                              width: 24.w,
                              child: Checkbox(
                                value: isTermsAccepted,
                                onChanged: (newValue) {
                                  setState(() {
                                    isTermsAccepted = newValue ?? false;
                                  });
                                },
                                activeColor: AppColors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                              ),
                            ),
                            Text.rich(
                              textScaler: TextScaler.linear(0.95),
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: S.of(context).register_page_title5,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).register_page_title6,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.yellow,
                                      shadows: [
                                        Shadow(
                                          color: AppColors.yellow,
                                          blurRadius: 2,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).register_page_title7,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: S.of(context).register_page_title8,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.yellow,
                                      shadows: [
                                        Shadow(
                                          color: AppColors.yellow,
                                          blurRadius: 1,
                                          offset: const Offset(0, 0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      MainButtonWidget(
                        title: S.of(context).register_page_button,
                        onPressed: () async {
                          if (formKey.currentState!.validate() &&
                              isTermsAccepted) {
                            await widget.authCubit.register(
                              RegisterRequestEntity(
                                name: fullNameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.015),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pop(),
                    child: Text.rich(
                      TextSpan(
                        text: S.of(context).register_page_title9,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                        children: [
                          TextSpan(
                            text: S.of(context).register_page_title10,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.yellow,
                              shadows: [
                                Shadow(
                                  color: AppColors.yellow,
                                  blurRadius: 2,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
