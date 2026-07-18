import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/search/presentation/view/widgets/movies_item_widget.dart';
import 'package:egy_film/features/watch_list/presentation/view_model/watch_list_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesTabViewWidget extends StatefulWidget {
  final WatchListCubit watchListCubit;
  const MoviesTabViewWidget({super.key, required this.watchListCubit});

  @override
  State<MoviesTabViewWidget> createState() => _MoviesTabViewWidgetState();
}

class _MoviesTabViewWidgetState extends State<MoviesTabViewWidget> {
  @override
  void initState() {
    widget.watchListCubit.getSavedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return RefreshIndicator(
      onRefresh: () async {
        widget.watchListCubit.getSavedMovies();
      },
      color: AppColors.yellow,
      backgroundColor: Colors.transparent,
      strokeWidth: 2.5,
      edgeOffset: 20,
      child: BlocBuilder<WatchListCubit, WatchListState>(
        bloc: widget.watchListCubit,
        buildWhen: (previous, current) => current is WatchListMoviesSuccess,
        builder: (context, state) {
          if (state is WatchListMoviesSuccess) {
            final savedMovies = state.savedMovies;
            if (savedMovies.isEmpty) {
              return Center(
                child: Text(
                  S.of(context).watch_list_page_title1,
                  style: TextStyle(color: AppColors.yellow, fontSize: 16.sp),
                ),
              );
            } else {
              return ListView.separated(
                itemCount: savedMovies.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: size.height * 0.03),
                itemBuilder: (context, index) {
                  final movie = savedMovies[index];
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(
                            AppRoutes.details,
                            arguments: {'id': movie.id, 'isMovie': true, 'isArabic': isArabic},
                          )
                          .then((_) {
                            widget.watchListCubit.getSavedMovies();
                          });
                    },
                    child: MoviesItemWidget(
                      posterPath: movie.posterPath,
                      title: movie.title,
                      voteAverage: movie.voteAverage,
                      category: movie.category,
                      releaseDate: movie.releaseDate.substring(0, 4),
                      runtime: movie.duration,
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
