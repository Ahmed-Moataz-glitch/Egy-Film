import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_toast.dart';
import 'package:egy_film/features/home/presentation/view/widgets/list_view_item_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/loading_widget.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class TvSeriesTabViewWidget extends StatefulWidget {
  final HomeCubit homeCubit;
  final bool isArabic;
  const TvSeriesTabViewWidget({
    super.key,
    required this.homeCubit,
    required this.isArabic,
  });

  @override
  State<TvSeriesTabViewWidget> createState() => _TvSeriesTabViewWidgetState();
}

class _TvSeriesTabViewWidgetState extends State<TvSeriesTabViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.homeCubit.getTopRatedTvSeries(widget.isArabic);
      widget.homeCubit.getPopularTvSeries(widget.isArabic);
      widget.homeCubit.getAiringTodayTvSeries(widget.isArabic);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).home_page_title1,
            style: TextStyle(
              color: AppColors.fillColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          BlocConsumer(
            bloc: widget.homeCubit,
            listenWhen: (previous, current) => current is TopRatedTvSeriesError,
            buildWhen: (previous, current) =>
                current is TopRatedTvSeriesSuccess ||
                current is TopRatedTvSeriesLoading,
            listener: (context, state) {
              if (state is TopRatedTvSeriesError) {
                AppToast.showToast(
                  context: context,
                  title: S.of(context).app_toast_error,
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              if (state is TopRatedTvSeriesLoading) {
                return LoadingWidget(
                  isArabic: isArabic,
                  isItemDetails: false,
                );
              }
              if (state is TopRatedTvSeriesSuccess) {
                var topRatedTvSeries = state.response.results;
                topRatedTvSeries = topRatedTvSeries
                    .where(
                      (topRatedTvSerie) =>
                          topRatedTvSerie.posterPath.isNotEmpty &&
                          topRatedTvSerie.backdropPath.isNotEmpty,
                    )
                    .toList();
                return SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedTvSeries.length,
                    itemBuilder: (context, index) {
                      return ListViewItemWidget(
                        items: topRatedTvSeries,
                        index: index,
                        isMovie: false,
                        isTopRated: true,
                        isArabic: isArabic,
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          SizedBox(height: size.height * 0.04),
          Text(
            S.of(context).home_page_title2,
            style: TextStyle(
              color: AppColors.fillColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          BlocConsumer(
            bloc: widget.homeCubit,
            listenWhen: (previous, current) => current is PopularTvSeriesError,
            buildWhen: (previous, current) =>
                current is PopularTvSeriesSuccess ||
                current is PopularTvSeriesLoading,
            listener: (context, state) {
              if (state is PopularTvSeriesError) {
                AppToast.showToast(
                  context: context,
                  title: S.of(context).app_toast_error,
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              if (state is PopularTvSeriesLoading) {
                return LoadingWidget(
                  isArabic: isArabic,
                  isItemDetails: false,
                );
              }
              if (state is PopularTvSeriesSuccess) {
                var popularTvSeries = state.response.results;
                popularTvSeries = popularTvSeries
                    .where(
                      (popularTvSerie) =>
                          popularTvSerie.posterPath.isNotEmpty &&
                          popularTvSerie.backdropPath.isNotEmpty,
                    )
                    .toList();
                return SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularTvSeries.length,
                    itemBuilder: (context, index) {
                      return ListViewItemWidget(
                        items: popularTvSeries,
                        index: index,
                        isMovie: false,
                        isTopRated: false,
                        isArabic: isArabic,
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          SizedBox(height: size.height * 0.04),
          Text(
            S.of(context).home_page_title3,
            style: TextStyle(
              color: AppColors.fillColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          BlocConsumer(
            bloc: widget.homeCubit,
            listenWhen: (previous, current) =>
                current is AiringTodayTvSeriesError,
            buildWhen: (previous, current) =>
                current is AiringTodayTvSeriesSuccess ||
                current is AiringTodayTvSeriesLoading,
            listener: (context, state) {
              if (state is AiringTodayTvSeriesError) {
                AppToast.showToast(
                  context: context,
                  title: S.of(context).app_toast_error,
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              if (state is AiringTodayTvSeriesLoading) {
                return LoadingWidget(
                  isArabic: isArabic,
                  isItemDetails: false,
                );
              }
              if (state is AiringTodayTvSeriesSuccess) {
                var airingTodayTvSeries = state.response.results;
                airingTodayTvSeries = airingTodayTvSeries
                    .where(
                      (airingTodayTvSerie) =>
                          airingTodayTvSerie.posterPath.isNotEmpty &&
                          airingTodayTvSerie.backdropPath.isNotEmpty,
                    )
                    .toList();
                return SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: airingTodayTvSeries.length,
                    itemBuilder: (context, index) {
                      return ListViewItemWidget(
                        items: airingTodayTvSeries,
                        index: index,
                        isMovie: false,
                        isTopRated: false,
                        isArabic: isArabic,
                      );
                    },
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
