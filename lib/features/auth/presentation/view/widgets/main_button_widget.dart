import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  const MainButtonWidget({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        width: size.width,
        decoration: BoxDecoration(
          color: onPressed != null ? AppColors.yellow : AppColors.gray,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6.w,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                
                color: onPressed != null ? AppColors.black : AppColors.fillColor,
              ),
            ),
            title == S.of(context).login_page_button || title == S.of(context).register_page_button 
            ? 
            SvgPicture.asset(
              AppAssets.signinIcon,
              colorFilter: ColorFilter.mode(AppColors.black, BlendMode.srcIn),
              width: 32.w,
              height: 32.h,
            )
            :
            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
