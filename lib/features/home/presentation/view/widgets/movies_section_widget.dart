import 'package:cached_network_image/cached_network_image.dart';
import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_toast.dart';
import 'package:egy_film/features/home/presentation/view/widgets/details_section_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/list_view_item_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/loading_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/trailers_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/rate_widget.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

class MoviesSectionWidget extends StatelessWidget {
  final HomeCubit homeCubit;
  const MoviesSectionWidget({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return Column(
      children: [
        BlocConsumer(
          bloc: homeCubit,
          listenWhen: (previous, current) => current is MovieDetailsError,
          buildWhen: (previous, current) =>
              current is MovieDetailsSuccess || current is MovieDetailsLoading,
          listener: (context, state) {
            if (state is MovieDetailsError) {
              AppToast.showToast(
                context: context,
                title: S.of(context).app_toast_error,
                description: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return LoadingWidget(isArabic: isArabic, isItemDetails: true);
            }
            if (state is MovieDetailsSuccess) {
              final movieDetails = state.response;
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
                                (movieDetails.backdropPath),
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
                                    (movieDetails.posterPath),
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
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.32,
                          left: size.width * 0.33,
                          child: Text(
                            movieDetails.title,
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
                          child: RateWidget(rate: movieDetails.voteAverage),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsSectionWidget(
                          releaseDate: movieDetails.releaseDate.substring(0, 4),
                          runtime: movieDetails.runtime,
                          category: movieDetails.genres.first.name,
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text(
                          movieDetails.overview,
                          maxLines: 6,
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
        SizedBox(height: size.height * 0.015),
        BlocConsumer<HomeCubit, HomeState>(
          bloc: homeCubit,
          listenWhen: (previous, current) => current is MovieTrailersError,
          buildWhen: (previous, current) =>
              current is MovieTrailersSuccess ||
              current is MovieTrailersLoading,
          listener: (context, state) {
            if (state is MovieTrailersError) {
              AppToast.showToast(
                context: context,
                title: S.of(context).app_toast_error,
                description: state.message,
                type: ToastificationType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is MovieTrailersLoading) {
              return LoadingWidget(isArabic: isArabic, isItemDetails: false);
            }
            if (state is MovieTrailersSuccess) {
              var movieTrailers = state.response.results;
              movieTrailers = movieTrailers
                  .where((movieTrailer) => movieTrailer.key.isNotEmpty)
                  .toList();
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  height: movieTrailers.isNotEmpty ? size.height * 0.25 : 0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieTrailers.length,
                    itemBuilder: (context, index) {
                      final trailer = movieTrailers[index];
                      return TrailersWidget(
                        trailersCount: movieTrailers.length,
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
                S.of(context).details_page_title2,
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
                    current is SimilarMoviesError,
                buildWhen: (previous, current) =>
                    current is SimilarMoviesLoading ||
                    current is SimilarMoviesSuccess,
                listener: (context, state) {
                  if (state is SimilarMoviesError) {
                    AppToast.showToast(
                      context: context,
                      title: S.of(context).app_toast_error,
                      description: state.message,
                      type: ToastificationType.error,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is SimilarMoviesLoading) {
                    return LoadingWidget(isArabic: isArabic, isItemDetails: false);
                  }
                  if (state is SimilarMoviesSuccess) {
                    var similarMovies = state.response.results;
                    similarMovies = similarMovies
                        .where(
                          (similarMovie) => similarMovie.posterPath.isNotEmpty,
                        )
                        .toList();
                    return similarMovies.isEmpty
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
                              itemCount: similarMovies.length,
                              itemBuilder: (context, index) {
                                return ListViewItemWidget(
                                  items: similarMovies,
                                  index: index,
                                  isMovie: true,
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
