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

class MoviesTabViewWidget extends StatefulWidget {
  final HomeCubit homeCubit;
  final bool isArabic;
  const MoviesTabViewWidget({
    super.key,
    required this.homeCubit,
    required this.isArabic,
  });

  @override
  State<MoviesTabViewWidget> createState() => _MoviesTabViewWidgetState();
}

class _MoviesTabViewWidgetState extends State<MoviesTabViewWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.homeCubit.getTopRatedMovies(widget.isArabic);
      widget.homeCubit.getPopularMovies(widget.isArabic);
      widget.homeCubit.getNowPlayingMovies(widget.isArabic);
    });
  }

  // @override
  // void dispose() {
  //   widget.homeCubit.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).home_page_title4,
            style: TextStyle(
              color: AppColors.fillColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          BlocConsumer(
            bloc: widget.homeCubit,
            listenWhen: (previous, current) => current is TopRatedMoviesError,
            buildWhen: (previous, current) =>
                current is TopRatedMoviesSuccess ||
                current is TopRatedMoviesLoading,
            listener: (context, state) {
              if (state is TopRatedMoviesError) {
                AppToast.showToast(
                  context: context,
                  title: S.of(context).app_toast_error,
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              if (state is TopRatedMoviesLoading) {
                return LoadingWidget(
                  isArabic: isArabic,
                  isItemDetails: false,
                );
              }
              if (state is TopRatedMoviesSuccess) {
                var topRatedMovies = state.response.results;
                topRatedMovies = topRatedMovies
                    .where(
                      (topRatedMovie) =>
                          topRatedMovie.posterPath.isNotEmpty &&
                          topRatedMovie.backdropPath.isNotEmpty,
                    )
                    .toList();
                return SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRatedMovies.length,
                    itemBuilder: (context, index) {
                      return ListViewItemWidget(
                        items: topRatedMovies,
                        index: index,
                        isMovie: true,
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
            S.of(context).home_page_title5,
            style: TextStyle(
              color: AppColors.fillColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          BlocConsumer(
            bloc: widget.homeCubit,
            listenWhen: (previous, current) => current is PopularMoviesError,
            buildWhen: (previous, current) =>
                current is PopularMoviesSuccess ||
                current is PopularMoviesLoading,
            listener: (context, state) {
              if (state is PopularMoviesError) {
                AppToast.showToast(
                  context: context,
                  title: S.of(context).app_toast_error,
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              if (state is PopularMoviesLoading) {
                return LoadingWidget(
                  isArabic: isArabic,
                  isItemDetails: false,
                );
              }
              if (state is PopularMoviesSuccess) {
                var popularMovies = state.response.results;
                popularMovies = popularMovies
                    .where(
                      (popularMovie) =>
                          popularMovie.posterPath.isNotEmpty &&
                          popularMovie.backdropPath.isNotEmpty,
                    )
                    .toList();
                return SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularMovies.length,
                    itemBuilder: (context, index) {
                      return ListViewItemWidget(
                        items: popularMovies,
                        index: index,
                        isMovie: true,
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
            S.of(context).home_page_title6,
            style: TextStyle(
              color: AppColors.fillColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          BlocConsumer(
            bloc: widget.homeCubit,
            listenWhen: (previous, current) => current is NowPlayingMoviesError,
            buildWhen: (previous, current) =>
                current is NowPlayingMoviesSuccess ||
                current is NowPlayingMoviesLoading,
            listener: (context, state) {
              if (state is NowPlayingMoviesError) {
                AppToast.showToast(
                  context: context,
                  title: S.of(context).app_toast_error,
                  description: state.message,
                  type: ToastificationType.error,
                );
              }
            },
            builder: (context, state) {
              if (state is NowPlayingMoviesLoading) {
                return LoadingWidget(
                  isArabic: isArabic,
                  isItemDetails: false,
                );
              }
              if (state is NowPlayingMoviesSuccess) {
                var nowPlayingMovies = state.response.results;
                nowPlayingMovies = nowPlayingMovies
                    .where(
                      (nowPlayingMovie) =>
                          nowPlayingMovie.posterPath.isNotEmpty &&
                          nowPlayingMovie.backdropPath.isNotEmpty,
                    )
                    .toList();
                return SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: nowPlayingMovies.length,
                    itemBuilder: (context, index) {
                      return ListViewItemWidget(
                        items: nowPlayingMovies,
                        index: index,
                        isMovie: true,
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
