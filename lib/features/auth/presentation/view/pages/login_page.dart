import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_dialogs.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/core/utils/app_toast.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/features/auth/domain/entities/login/login_request_entity.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/login_method_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/validator.dart';
import 'package:egy_film/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  late AuthCubit authCubit;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    authCubit = getIt<AuthCubit>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    authCubit.close();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      resizeToAvoidBottomInset: true,
      body: BlocListener<AuthCubit, AuthState>(
        bloc: authCubit,
        listener: (context, state) {
          if (state is AuthLoading) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).login_page_loading);
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
            Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamedAndRemoveUntil(AppRoutes.appSection, (route) => false);
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
                      borderRadius: BorderRadius.circular(12),
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
                  S.of(context).login_page_title1,
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  S.of(context).login_page_title2,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).login_page_title3,
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
                        hintText: 'name@example.com',
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        S.of(context).login_page_title4,
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
                        hintText: '************',
                        isPassword: true,
                        obscureText: true,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushNamed(
                              AppRoutes.forgetPassword,
                              arguments: authCubit,
                            );
                          },
                          child: Text(
                            S.of(context).login_page_title5,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.03),
                      MainButtonWidget(
                        title: S.of(context).login_page_button,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await authCubit.loginWithEmailAndPassword(
                              LoginRequestEntity(
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
                SizedBox(height: size.height * 0.02),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.gray,
                        thickness: 1,
                        height: 32,
                        indent: 8,
                        endIndent: 10,
                      ),
                    ),
                    Text(
                      S.of(context).login_page_title6,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.semiBlack,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.gray,
                        thickness: 1,
                        height: 32,
                        indent: 10,
                        endIndent: 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                LoginMethodWidget(
                  iconPath: AppAssets.googleIcon,
                  title: S.of(context).login_page_title7,
                  onTap: () async {
                    await authCubit.loginWithGoogle();
                  },
                ),
                SizedBox(height: size.height * 0.13),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(
                          AppRoutes.register,
                          arguments: authCubit,
                        ),
                    child: Text.rich(
                      TextSpan(
                        text: S.of(context).login_page_title8,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.black,
                        ),
                        children: [
                          TextSpan(
                            text: S.of(context).login_page_title9,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              shadows: [
                                Shadow(
                                  color: AppColors.yellow,
                                  blurRadius: 1,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                              color: AppColors.yellow,
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
