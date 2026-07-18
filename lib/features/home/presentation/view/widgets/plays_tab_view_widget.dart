import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/home/data/model/play_model.dart';
import 'package:egy_film/features/home/presentation/view/widgets/plays_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaysTabViewWidget extends StatefulWidget {
  final bool isArabic;
  const PlaysTabViewWidget({super.key, required this.isArabic});

  @override
  State<PlaysTabViewWidget> createState() => _PlaysTabViewWidgetState();
}

class _PlaysTabViewWidgetState extends State<PlaysTabViewWidget> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24.h,
          crossAxisSpacing: 16.w,
          childAspectRatio: 0.7,
        ),
        itemCount: plays.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              Navigator.of(
                context,
              ).pushNamed(AppRoutes.playDetails, arguments: plays[index]);
            },
            child: PlaysItemWidget(playModel: plays[index]),
          );
        },
      ),
    );
  }
}
