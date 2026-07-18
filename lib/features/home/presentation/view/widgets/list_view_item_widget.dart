import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class ListViewItemWidget extends StatelessWidget {
  final dynamic items;
  final int index;
  final bool isMovie;
  final bool isTopRated;
  final bool isArabic;
  const ListViewItemWidget({
    super.key,
    required this.items,
    required this.index,
    required this.isMovie,
    required this.isTopRated,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final item = items[index];
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.details,
          arguments: {'id': item.id, 'isMovie': isMovie, 'isArabic': isArabic},
        );
      },
      child: Stack(
        children: [
          Container(
            width: size.width * 0.3,
            margin: index < items.length - 1
                ? isArabic
                      ? EdgeInsets.only(left: 16.w)
                      : EdgeInsets.only(right: 16.w)
                : null,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: '${AppConstants.imageUrlPrefix}${item.posterPath}',
                fit: BoxFit.fill,
                placeholder: (context, url) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.gray.withAlpha(100),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(AppColors.yellow),
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
          ),
          isTopRated
              ? Positioned(
                  bottom: -15.h,
                  left: isArabic ? null : 0,
                  right: isArabic ? 5.w : null,
                  child: GradientText(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 55.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    gradientType: GradientType.linear,
                    colors: [AppColors.blue, AppColors.red],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
