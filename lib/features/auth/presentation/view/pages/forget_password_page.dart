import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_dialogs.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/validator.dart';
import 'package:egy_film/features/auth/presentation/view_model/auth_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordPage extends StatefulWidget {
  final AuthCubit authCubit;
  const ForgetPasswordPage({super.key, required this.authCubit});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      appBar: AppBar(
        backgroundColor: AppColors.fillColor,
        title: Text(
          S.of(context).forget_password_page_app_bar,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthCubit, AuthState>(
        bloc: widget.authCubit,
        listenWhen: (previous, current) => current is SendingOtp || current is OtpSent || current is SendingOtpError,
        listener: (context, state) {
          if(state is SendingOtp){
            AppDialogs.showLoadingDialog(context, title: S.of(context).forget_password_page_title1);
          }else{
            Navigator.of(context, rootNavigator: true).pop();
          }
          if (state is OtpSent) {
            Navigator.of(
              context,
            ).pushNamed(
              AppRoutes.verifyCode, 
              arguments: {
                'email': emailController.text.trim(),
                'authCubit': widget.authCubit,
              },
            );
          }
          if (state is SendingOtpError) {
            debugPrint(state.message);
            AppDialogs.showSnackBar(
              context: context,
              message: state.message,
              isError: true,
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
              S.of(context).forget_password_page_title2,
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
                    S.of(context).forget_password_page_title3,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormFieldWidget(
                    controller: emailController,
                    validator: Validator.validateEmail,
                    hintText: 'name@example.com',
                  ),
                  SizedBox(height: size.height * 0.05),
                  MainButtonWidget(
                    title: S.of(context).forget_password_page_button,
                    onPressed: () async {
                      // if(formKey.currentState!.validate()){
                      //   Navigator.of(context).pushNamed(AppRoutes.verifyCode);
                      // }
                      if (formKey.currentState!.validate()) {
                        await widget.authCubit.sendOtpForExistingUser(emailController.text.trim());
                        // if (!context.mounted) {
                        //   return;
                        // }
                        // AppDialogs.showSnackBar(
                        //   context: context,
                        //   message: 'Code is sent to email',
                        //   isError: true,
                        // );
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
