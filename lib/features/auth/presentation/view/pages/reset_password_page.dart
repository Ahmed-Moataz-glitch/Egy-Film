import 'package:egy_film/core/utils/app_colors.dart';
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

class ResetPasswordPage extends StatefulWidget {
  final AuthCubit authCubit;
  const ResetPasswordPage({super.key, required this.authCubit});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final token = SecureStorage.getToken();
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      appBar: AppBar(
        backgroundColor: AppColors.fillColor,
        title: Text(
          S.of(context).reset_password_page_app_bar,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: widget.authCubit,
        listenWhen: (previous, current) =>
            current is AuthSuccess || current is AuthError,
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.of(context).pushNamed(AppRoutes.successfulResetPassword);
          }
          if (state is AuthError) {
            AppToast.showToast(
              context: context,
              title: S.of(context).app_toast_error,
              description: state.message,
              type: ToastificationType.error,
            );
          }
        },
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            top: 36.h,
            right: 16.w,
            left: 16.w,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.h,
          ),
          child: Column(
            children: [
              Text(
                S.of(context).reset_password_page_title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).reset_password_page_title2,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormFieldWidget(
                      isPassword: true,
                      obscureText: true,
                      controller: newPasswordController,
                      validator: Validator.validatePassword,
                      hintText: S.of(context).reset_password_page_title2_hint_text,
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      S.of(context).reset_password_page_title3,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormFieldWidget(
                      isPassword: true,
                      obscureText: true,
                      controller: confirmPasswordController,
                      validator: (value) => Validator.validateConfirmPassword(
                        value,
                        newPasswordController.text.trim(),
                      ),
                      hintText: S.of(context).reset_password_page_title3_hint_text,
                    ),
                    SizedBox(height: size.height * 0.05),
                    MainButtonWidget(
                      title: S.of(context).reset_password_page_button,
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await widget.authCubit.resetPassword(
                            RegisterRequestEntity(
                              password: newPasswordController.text.trim(),
                            ),
                          );
                          // if (!context.mounted) {
                          //   return;
                          // }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
