import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/features/home/presentation/view/widgets/movies_tab_view_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/plays_tab_view_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/tv_series_tab_view_widget.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final HomeCubit homeCubit;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    homeCubit = getIt<HomeCubit>();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    homeCubit.close();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: S.of(context).home_page_tab1),
                  Tab(text: S.of(context).home_page_tab2),
                  Tab(text: S.of(context).home_page_tab3),
                ],
                labelColor: AppColors.fillColor,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                indicatorColor: AppColors.yellow,
                unselectedLabelColor: AppColors.gray,
                controller: tabController,
              ),
              SizedBox(height: size.height * 0.06),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    MoviesTabViewWidget(
                      homeCubit: homeCubit,
                      isArabic: isArabic,
                    ),
                    TvSeriesTabViewWidget(homeCubit: homeCubit, isArabic: isArabic),
                    PlaysTabViewWidget(isArabic: isArabic),
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
