import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/features/watch_list/presentation/view/widgets/movies_tab_view_widget.dart';
import 'package:egy_film/features/watch_list/presentation/view/widgets/tv_series_tab_view_widget.dart';
import 'package:egy_film/features/watch_list/presentation/view_model/watch_list_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> with TickerProviderStateMixin {
  late final WatchListCubit watchListCubit;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    watchListCubit = getIt<WatchListCubit>();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    watchListCubit.close();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    MoviesTabViewWidget(watchListCubit: watchListCubit),
                    TvSeriesTabViewWidget(watchListCubit: watchListCubit),
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
