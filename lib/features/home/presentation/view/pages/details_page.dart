import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/presentation/view/widgets/movies_section_widget.dart';
import 'package:egy_film/features/home/presentation/view/widgets/tv_series_section_widget.dart';
import 'package:egy_film/features/home/presentation/view_model/home_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatefulWidget {
  final int id;
  final bool isMovie;
  final bool isArabic;
  const DetailsPage({super.key, required this.id, required this.isMovie, required this.isArabic});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late final HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.isMovie) {
        homeCubit.getMovieDetails(movieId: widget.id, isArabic: widget.isArabic);
        homeCubit.getMovieTrailers(movieId: widget.id, isArabic: widget.isArabic);
        homeCubit.getSimilarMovies(movieId: widget.id, isArabic: widget.isArabic);
      } else {
        homeCubit.getTvSeriesDetails(tvSeriesId: widget.id, isArabic: widget.isArabic);
        homeCubit.getTvSeriesTrailers(tvSeriesId: widget.id, isArabic: widget.isArabic);
        homeCubit.getSimilarTvSeries(tvSeriesId: widget.id, isArabic: widget.isArabic);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.dark,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.fillColor),
        ),
        title: Text(
          S.of(context).details_page_app_bar,
          style: TextStyle(
            color: AppColors.fillColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            buildWhen: (previous, current) =>
                current is MovieDetailsSuccess ||
                current is TvSeriesDetailsSuccess,
            builder: (context, state) {
              if (state is MovieDetailsSuccess) {
                final movie = state.response;
                final isMovieSaved = homeCubit.isMovieSaved(movie.id);
                return IconButton(
                  onPressed: () async {
                    setState(() {});
                    await homeCubit.saveMovie(
                      MovieModel(
                        id: movie.id,
                        posterPath: movie.posterPath,
                        title: movie.title,
                        voteAverage: movie.voteAverage,
                        category: movie.genres.first.name,
                        releaseDate: movie.releaseDate.substring(0, 4),
                        duration: movie.runtime,
                      ),
                    );
                  },
                  icon: Icon(
                    isMovieSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: AppColors.fillColor,
                    size: 32.sp,
                  ),
                );
              }
              if (state is TvSeriesDetailsSuccess) {
                final tvSeries = state.response;
                final isTvSeriesSaved = homeCubit.isTvSeriesSaved(
                  tvSeries.id,
                );
                return IconButton(
                  onPressed: () async {
                    setState(() {});
                    await homeCubit.saveTvSeries(
                      TvSeriesModel(
                        id: tvSeries.id,
                        posterPath: tvSeries.posterPath,
                        name: tvSeries.name,
                        voteAverage: tvSeries.voteAverage,
                        category: tvSeries.genres!.first.name!,
                        firstAirDate:
                            tvSeries.firstAirDate.substring(0, 4),
                        duration: tvSeries.episodeRunTime.first,
                      ),
                    );
                  },
                  icon: Icon(
                    isTvSeriesSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: AppColors.fillColor,
                    size: 32.sp,
                  ),
                );
              } else {
                // return IconButton(
                //   onPressed: () {},
                //   icon: Icon(
                //     Icons.bookmark_border,
                //     color: AppColors.fillColor,
                //     size: 32,
                //   ),
                // );
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.isMovie
                  ? MoviesSectionWidget(homeCubit: homeCubit)
                  : TvSeriesSectionWidget(homeCubit: homeCubit),
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
