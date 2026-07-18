import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsSectionWidget extends StatelessWidget {
  final String releaseDate;
  final int runtime;
  final String category;
  const DetailsSectionWidget({
    super.key,
    required this.releaseDate,
    required this.runtime,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      spacing: 6.w,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.dateIconImage, width: 18.w, height: 18.h),
        Text(
          releaseDate,
          style: TextStyle(
            color: AppColors.fillColor.withAlpha(200),
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
          child: VerticalDivider(
            color: AppColors.fillColor.withAlpha(200),
            thickness: 1.r,
            width: 20.r,
          ),
        ),
        Image.asset(AppAssets.durationIconImage, width: 18.w, height: 18.h),
        Text(
          '$runtime ${S.of(context).details_page_title1}',
          style: TextStyle(
            color: AppColors.fillColor.withAlpha(200),
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
          child: VerticalDivider(
            color: AppColors.fillColor.withAlpha(200),
            thickness: 1.r,
            width: 20.r,
          ),
        ),
        Image.asset(AppAssets.categoryIconImage, width: 18.w, height: 18.h),
        Text(
          category,
          style: TextStyle(
            color: AppColors.fillColor.withAlpha(200),
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
