// ignore_for_file: use_build_context_synchronously
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_dialogs.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/verify_code_widget.dart';
import 'package:egy_film/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailPage extends StatefulWidget {
  final AuthCubit authCubit;
  final String? email;
  const VerifyEmailPage({super.key, required this.email, required this.authCubit});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late PinInputController otpController;

  @override
  void initState() {
    super.initState();
    otpController = PinInputController();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      appBar: AppBar(
        backgroundColor: AppColors.fillColor,
        title: Text(
          S.of(context).verify_email_page_app_bar,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: widget.authCubit,
        listenWhen: (previous, current) =>
            current is SendingOtp ||
            current is OtpVerified ||
            current is VerifyingOtpError ||
            current is OtpSent ||
            current is SendingOtpError,
        listener: (context, state) {
          if (state is SendingOtp) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).verify_email_page_title1);
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if(state is OtpVerified){
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.login,
              (route) => false,
            );
          }
          if(state is VerifyingOtpError){
            debugPrint(state.message);
            AppDialogs.showSnackBar(context: context, message: state.message, isError: true);
          }
          if (state is OtpSent) {
            AppDialogs.showSnackBar(context: context, message: state.message);
          }
          if (state is SendingOtpError) {
            AppDialogs.showSnackBar(
              context: context,
              message: state.message,
              isError: true,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          child: Column(
            children: [
              Text(
                S.of(context).verify_email_page_title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Text.rich(
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  text: S.of(context).verify_email_page_title3,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                  children: [
                    TextSpan(
                      text: widget.email ?? 'ahmedmoataz123@gmail.com',
                      style: TextStyle(
                        fontSize: 18.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.04),
              VerifyCodeWidget(pinController: otpController),
              SizedBox(height: size.height * 0.04),
              MainButtonWidget(
                title: S.of(context).verify_email_page_button,
                onPressed: () async {
                  // debugPrint('Verification code: ${verificationController.text}');
                  await widget.authCubit.validateOtp(
                    email: widget.email ?? '',
                    otp: otpController.text.trim(),
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              Text.rich(
                TextSpan(
                  text: S.of(context).verify_email_page_title4,
                  style: TextStyle(fontSize: 16.sp, color: AppColors.black),
                  children: [
                    TextSpan(
                      text: S.of(context).verify_email_page_title5,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.yellow,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await widget.authCubit.sendOtpForNewUser(widget.email ?? '');
                          // AppDialogs.showSnackBar(
                          //   context: context,
                          //   message: 'Code resent successfully',
                          // );
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
