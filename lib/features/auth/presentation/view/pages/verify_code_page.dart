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

class VerifyCodePage extends StatefulWidget {
  final AuthCubit authCubit;
  final String? email;
  const VerifyCodePage({super.key, required this.email, required this.authCubit});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
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
          S.of(context).verify_code_page_app_bar,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: widget.authCubit,
        listenWhen: (previous, current) =>
            current is SendingOtp ||
            current is OtpSent ||
            current is SendingOtpError ||
            current is OtpVerified ||
            current is VerifyingOtpError,
        listener: (context, state) {
          if (state is SendingOtp) {
            AppDialogs.showLoadingDialog(context, title: S.of(context).verify_code_page_title1);
          } else {
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is OtpVerified) {
            Navigator.of(context).pushNamed(
              AppRoutes.resetPassword,
              arguments: widget.authCubit,
            );
          }
          if (state is VerifyingOtpError) {
            AppDialogs.showSnackBar(
              context: context,
              message: state.message,
              isError: true,
            );
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
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
          child: Column(
            children: [
              Text(
                S.of(context).verify_code_page_title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray.withValues(alpha: 0.8),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Text.rich(
                overflow: TextOverflow.ellipsis,
                TextSpan(
                  text: S.of(context).verify_code_page_title3,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
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
                title: S.of(context).verify_code_page_button,
                onPressed: () async {
                  // debugPrint('Verification code: ${verificationController.text}');
                  await widget.authCubit.validateOtp(
                    email: widget.email ?? '',
                    otp: otpController.text,
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              Text.rich(
                TextSpan(
                  text: S.of(context).verify_code_page_title4,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                  children: [
                    TextSpan(
                      text: S.of(context).verify_code_page_title5,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.yellow,
                        shadows: [
                          Shadow(
                            color: AppColors.yellow,
                            blurRadius: 2,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          await widget.authCubit.sendOtpForExistingUser(widget.email ?? '');
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
