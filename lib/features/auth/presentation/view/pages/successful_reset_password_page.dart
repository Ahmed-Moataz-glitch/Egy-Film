import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/main_button_widget.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfulResetPasswordPage extends StatelessWidget {
  const SuccessfulResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.fillColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: size.width * 0.4,
                  height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: AppColors.gray.withAlpha(120),
                  borderRadius: BorderRadius.circular(96),
                ),
                ),
                Image.asset(
                  AppAssets.successfulResetPasswordImage,
                  width: size.width * 0.23,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              S.of(context).successful_reset_password_page_title1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              S.of(context).successful_reset_password_page_title2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            MainButtonWidget(title: S.of(context).successful_reset_password_page_button, onPressed: (){
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
            }),
          ],
        ),
      ),
    );
  }
}