import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/features/home/data/model/play_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PlaysItemWidget extends StatelessWidget {
  final PlayModel playModel;
  const PlaysItemWidget({super.key, required this.playModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      spacing: 8.h,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: CachedNetworkImage(
            imageUrl: playModel.thumbnail,
            width: size.width * 0.4,
            height: size.height * 0.22,
            fit: BoxFit.fill,
            placeholder: (context, url) {
              return Skeletonizer(
                enabled: true,
                child: SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width * 0.4,
                        height: size.height * 0.22,
                        decoration: BoxDecoration(
                          color: AppColors.gray.withAlpha(100),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Text(
          playModel.title,
          style: TextStyle(
            color: AppColors.fillColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
