import 'package:egy_film/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RateWidget extends StatelessWidget {
  final double rate;
  const RateWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.17,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(150),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        textDirection: TextDirection.ltr,
        spacing: 4.w,
        children: [
          Icon(
            Icons.star_border_rounded,
            color: AppColors.yellow,
            size: 22.sp,
          ),
          Text(
            rate.toStringAsFixed(1),
            style: TextStyle(
              color: AppColors.yellow,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}