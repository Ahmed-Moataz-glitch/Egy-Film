import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_toast.dart';
import 'package:egy_film/features/home/presentation/view/widgets/details_section_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/list_view_item_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/loading_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/rate_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/trailers_widget.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class TvSeriesSectionWidget extends StatelessWidget {
  final HomeCubit homeCubit;
  const TvSeriesSectionWidget({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return Column(
      children: [
        BlocConsumer(
          bloc: homeCubit,
          listenWhen: (previous, current) => current is TvSeriesDetailsError,
          buildWhen: (previous, current) =>
              current is TvSeriesDetailsSuccess ||
              current is TvSeriesDetailsLoading,
          listener: (context, state) {
            if (state is TvSeriesDetailsError) {
              AppToast.showToast(
                context: context,
                title: S.of(context).app_toast_error,
                description: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is TvSeriesDetailsLoading) {
              return LoadingWidget(isArabic: isArabic, isItemDetails: true);
            }
            if (state is TvSeriesDetailsSuccess) {
              final tvSeriesDetails = state.response;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: size.height * 0.3,
                          width: size.width,
                          child: CachedNetworkImage(
                            imageUrl:
                                AppConstants.imageUrlPrefix +
                                (tvSeriesDetails.backdropPath),
                            fit: BoxFit.fill,
                            placeholder: (context, url) {
                              return const Center(
                                child: CircularProgressIndicator.adaptive(
                                  valueColor: AlwaysStoppedAnimation(
                                    AppColors.yellow,
                                  ),
                                ),
                              );
                            },
                            errorWidget: (context, url, error) {
                              return const Center(child: Icon(Icons.error));
                            },
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.19,
                          left: size.width * 0.04,
                          child: SizedBox(
                            height: size.height * 0.19,
                            width: size.width * 0.26,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: CachedNetworkImage(
                                imageUrl:
                                    AppConstants.imageUrlPrefix +
                                    (tvSeriesDetails.posterPath),
                                fit: BoxFit.fill,
                                placeholder: (context, url) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.gray.withAlpha(100),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: const Center(
                                      child: CircularProgressIndicator.adaptive(
                                        valueColor: AlwaysStoppedAnimation(
                                          AppColors.yellow,
                                        ),
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
                        ),
                        Positioned(
                          top: size.height * 0.32,
                          left: size.width * 0.33,
                          child: Text(
                            tvSeriesDetails.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: AppColors.fillColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.25,
                          left: size.width * 0.8,
                          child: RateWidget(rate: tvSeriesDetails.voteAverage),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsSectionWidget(
                          releaseDate: tvSeriesDetails.firstAirDate.substring(
                            0,
                            4,
                          ),
                          runtime: tvSeriesDetails.episodeRunTime.first,
                          category: tvSeriesDetails.genres?.first.name ?? '',
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                          tvSeriesDetails.overview,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.fillColor.withAlpha(200),
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        SizedBox(height: size.height * 0.02),
        BlocConsumer<HomeCubit, HomeState>(
          bloc: homeCubit,
          listenWhen: (previous, current) => current is TvSeriesTrailersError,
          buildWhen: (previous, current) =>
              current is TvSeriesTrailersSuccess ||
              current is TvSeriesTrailersLoading,
          listener: (context, state) {
            if (state is TvSeriesTrailersError) {
              AppToast.showToast(
                context: context,
                title: S.of(context).app_toast_error,
                description: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is TvSeriesTrailersLoading) {
              return LoadingWidget(isArabic: isArabic, isItemDetails: false);
            }
            if (state is TvSeriesTrailersSuccess) {
              var tvSeriesTrailers = state.response.results;
              tvSeriesTrailers = tvSeriesTrailers
                  .where((tvSeriesTrailer) => tvSeriesTrailer.key.isNotEmpty)
                  .toList();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  height: size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tvSeriesTrailers.length,
                    itemBuilder: (context, index) {
                      final trailer = tvSeriesTrailers[index];
                      return TrailersWidget(
                        trailersCount: tvSeriesTrailers.length,
                        trailerId: trailer.key,
                      );
                    },
                  ),
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        SizedBox(height: size.height * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).details_page_title3,
                style: TextStyle(
                  color: AppColors.fillColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              BlocConsumer(
                bloc: homeCubit,
                listenWhen: (previous, current) =>
                    current is SimilarTvSeriesError,
                buildWhen: (previous, current) =>
                    current is SimilarTvSeriesLoading ||
                    current is SimilarTvSeriesSuccess,
                listener: (context, state) {
                  if (state is SimilarTvSeriesError) {
                    AppToast.showToast(
                      context: context,
                      title: S.of(context).app_toast_error,
                      description: state.message,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SimilarTvSeriesLoading) {
                    return LoadingWidget(isArabic: isArabic, isItemDetails: false);
                  }
                  if (state is SimilarTvSeriesSuccess) {
                    var similarTvSeries = state.response.results;
                    similarTvSeries = similarTvSeries
                        .where(
                          (similarTvSerie) =>
                              similarTvSerie.posterPath.isNotEmpty,
                        )
                        .toList();
                    return similarTvSeries.isEmpty
                        ? Center(
                            child: Text(
                              S.of(context).details_page_no_similar_movies,
                              style: TextStyle(
                                color: AppColors.yellow,
                                fontSize: 16.sp,
                              ),
                            ),
                          )
                        : SizedBox(
                            height: size.height * 0.22,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: similarTvSeries.length,
                              itemBuilder: (context, index) {
                                return ListViewItemWidget(
                                  items: similarTvSeries,
                                  index: index,
                                  isMovie: false,
                                  isTopRated: false,
                                  isArabic: isArabic,
                                );
                              },
                            ),
                          );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
