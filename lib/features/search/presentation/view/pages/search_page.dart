import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/get_it.dart';
import 'package:egy_film/features/search/presentation/view/widgets/movies_search_tab_view_widget.dart';
import 'package:egy_film/features/search/presentation/view/widgets/tv_series_search_tab_view_widget.dart';
import 'package:egy_film/features/search/presentation/view_model/search_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  late final SearchCubit searchCubit;
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    searchCubit = getIt<SearchCubit>();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    searchCubit.close();
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
                    MoviesSearchTabViewWidget(searchCubit: searchCubit),
                    TvSeriesSearchTabViewWidget(searchCubit: searchCubit),
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