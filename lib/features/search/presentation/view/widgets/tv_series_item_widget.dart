import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_film/core/utils/app_assets.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvSeriesItemWidget extends StatelessWidget {
  final String posterPath;
  final String name;
  final double voteAverage;
  final String? category;
  final String firstAirDate;
  final int? runtime;
  const TvSeriesItemWidget({super.key, required this.posterPath, required this.name, required this.voteAverage, this.category, required this.firstAirDate, this.runtime});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            width: size.width * 0.23,
            height: size.height * 0.17,
            imageUrl: AppConstants.imageUrlPrefix + posterPath,
            fit: BoxFit.fill,
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.yellow),
              );
            },
            errorWidget: (context, url, error) {
              return const Icon(Icons.error, color: AppColors.red);
            },
          ),
        ),
        SizedBox(width: size.width * 0.03),
        Expanded(
          child: Column(
            spacing: size.height * 0.004,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.fillColor,
                  fontSize: 18.sp,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.015),
              Row(
                children: [
                  Image.asset(
                    AppAssets.starIconImage,
                    color: AppColors.yellow,
                    width: 16.w,
                    height: 16.h,
                  ),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    voteAverage.toStringAsFixed(1),
                    style: TextStyle(color: AppColors.yellow, fontSize: 15.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(AppAssets.categoryIconImage, width: 16.w, height: 16.h),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    category ?? S.of(context).default_category,
                    style: TextStyle(
                      color: AppColors.fillColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(AppAssets.dateIconImage, width: 16.w, height: 16.h),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    firstAirDate,
                    style: TextStyle(
                      color: AppColors.fillColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(AppAssets.durationIconImage, width: 16.w, height: 16.h),
                  SizedBox(width: size.width * 0.01),
                  Text(
                    '${runtime ?? 139} ${S.of(context).details_page_title1}',
                    style: TextStyle(
                      color: AppColors.fillColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
