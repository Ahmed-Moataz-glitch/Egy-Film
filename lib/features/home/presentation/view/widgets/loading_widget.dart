import 'package:egy_film/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingWidget extends StatelessWidget {
  final bool isItemDetails;
  final bool isArabic;
  const LoadingWidget({
    super.key,
    required this.isArabic,
    required this.isItemDetails,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: isItemDetails ? size.height * 0.4 : size.height * 0.22,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: isItemDetails ? 1 : 15,
          itemBuilder: (context, index) {
            return Container(
              width: isItemDetails ? size.width : size.width * 0.3,
              height: isItemDetails ? size.height * 0.3 : size.height * 0.22,
              margin: isItemDetails
                  ? null
                  : index < 14
                  ? isArabic
                        ? EdgeInsets.only(left: 16.w)
                        : EdgeInsets.only(right: 16.w)
                  : null,
              decoration: BoxDecoration(
                color: AppColors.gray.withAlpha(100),
                borderRadius: BorderRadius.circular(12.r),
              ),
            );
          },
        ),
      ),
    );
  }
}
