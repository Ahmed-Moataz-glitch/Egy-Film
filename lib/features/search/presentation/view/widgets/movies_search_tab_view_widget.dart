import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/validator.dart';
import 'package:egy_film/features/search/presentation/view/widgets/movies_item_widget.dart';
import 'package:egy_film/features/search/presentation/view_model/search_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesSearchTabViewWidget extends StatefulWidget {
  final SearchCubit searchCubit;
  const MoviesSearchTabViewWidget({super.key, required this.searchCubit});

  @override
  State<MoviesSearchTabViewWidget> createState() =>
      _MoviesSearchTabViewWidgetState();
}

class _MoviesSearchTabViewWidgetState extends State<MoviesSearchTabViewWidget> {
  late final TextEditingController moviesSearchController;

  @override
  void initState() {
    super.initState();
    moviesSearchController = TextEditingController();
  }

  @override
  void dispose() {
    moviesSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isArabic = AppLocalization.isArabic();
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldWidget(
            controller: moviesSearchController,
            validator: Validator.validateName,
            hintText: S.of(context).search_page_title1,
            isSearch: true,
            searchOnPressed: () {
              final query = moviesSearchController.text.trim();
              if (query.isNotEmpty) {
                widget.searchCubit.getMoviesSearch(
                  searchText: query,
                  isArabic: isArabic,
                );
              }
            },
          ),
          SizedBox(height: size.height * 0.04),
          BlocBuilder<SearchCubit, SearchState>(
            bloc: widget.searchCubit,
            buildWhen: (previous, current) =>
                current is MoviesSearchLoading ||
                current is MoviesSearchSuccess ||
                current is MoviesSearchError,
            builder: (context, state) {
              if (state is MoviesSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.yellow),
                );
              } else if (state is MoviesSearchError) {
                return Center(child: Text(state.message));
              } else if (state is MoviesSearchSuccess) {
                var movies = state.response.results;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movies.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: size.height * 0.03),
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.details,
                          arguments: {
                            'id': movie.id, 
                            'isMovie': true,
                            'isArabic': isArabic,
                          },
                        );
                      },
                      child: MoviesItemWidget(
                        posterPath: movie.posterPath,
                        title: movie.title,
                        voteAverage: movie.voteAverage,
                        releaseDate: movie.releaseDate.substring(0, 4),
                      ),
                    );
                  },
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
