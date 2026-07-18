import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/search/presentation/view/widgets/tv_series_item_widget.dart';
import 'package:egy_film/features/watch_list/presentation/view_model/watch_list_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TvSeriesTabViewWidget extends StatefulWidget {
  final WatchListCubit watchListCubit;
  const TvSeriesTabViewWidget({super.key, required this.watchListCubit});

  @override
  State<TvSeriesTabViewWidget> createState() => _TvSeriesTabViewWidgetState();
}

class _TvSeriesTabViewWidgetState extends State<TvSeriesTabViewWidget> {
  @override
  void initState() {
    widget.watchListCubit.getSavedTvSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return RefreshIndicator(
      onRefresh: () async {
        widget.watchListCubit.getSavedTvSeries();
      },
      color: AppColors.yellow,
      backgroundColor: Colors.transparent,
      strokeWidth: 2.5,
      edgeOffset: 20,
      child: BlocBuilder<WatchListCubit, WatchListState>(
        bloc: widget.watchListCubit,
        buildWhen: (previous, current) => current is WatchListTvSeriesSuccess,
        builder: (context, state) {
          if (state is WatchListTvSeriesSuccess) {
            final savedTvSeries = state.savedTvSeries;
            if (savedTvSeries.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).watch_list_page_title2,
                  style: TextStyle(color: AppColors.yellow, fontSize: 16.sp),
                ),
              );
            } else {
              return ListView.separated(
                itemCount: savedTvSeries.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: size.height * 0.03),
                itemBuilder: (context, index) {
                  final tvSeries = savedTvSeries[index];
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(
                            AppRoutes.details,
                            arguments: {'id': tvSeries.id, 'isMovie': false, 'isArabic': isArabic},
                          )
                          .then((_) {
                            widget.watchListCubit.getSavedTvSeries();
                          });
                    },
                    child: TvSeriesItemWidget(
                      posterPath: tvSeries.posterPath,
                      name: tvSeries.name,
                      voteAverage: tvSeries.voteAverage,
                      category: tvSeries.category,
                      firstAirDate: tvSeries.firstAirDate.substring(0, 4),
                      runtime: tvSeries.duration,
                    ),
                  );
                },
              );
            }
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
