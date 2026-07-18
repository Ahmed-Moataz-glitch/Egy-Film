import 'package:egy_film/core/utils/app_colors.dart';
import 'package:egy_film/core/utils/app_localization.dart';
import 'package:egy_film/core/utils/app_routes.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/text_form_field_widget.dart';
import 'package:egy_film/features/auth/presentation/view/widgets/validator.dart';
import 'package:egy_film/features/search/presentation/view/widgets/tv_series_item_widget.dart';
import 'package:egy_film/features/search/presentation/view_model/search_cubit.dart';
import 'package:egy_film/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TvSeriesSearchTabViewWidget extends StatefulWidget {
  final SearchCubit searchCubit;
  const TvSeriesSearchTabViewWidget({super.key, required this.searchCubit});

  @override
  State<TvSeriesSearchTabViewWidget> createState() =>
      _TvSeriesSearchTabViewWidgetState();
}

class _TvSeriesSearchTabViewWidgetState
    extends State<TvSeriesSearchTabViewWidget> {
  late final TextEditingController tvSeriesSearchController;

  @override
  void initState() {
    super.initState();
    tvSeriesSearchController = TextEditingController();
  }

  @override
  void dispose() {
    tvSeriesSearchController.dispose();
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
            controller: tvSeriesSearchController,
            validator: Validator.validateName,
            hintText: S.of(context).search_page_title2,
            isSearch: true,
            searchOnPressed: () {
              final query = tvSeriesSearchController.text.trim();
              if (query.isNotEmpty) {
                widget.searchCubit.getTvSeriesSearch(
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
                current is TvSeriesSearchLoading ||
                current is TvSeriesSearchSuccess ||
                current is TvSeriesSearchError,
            builder: (context, state) {
              if (state is TvSeriesSearchLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.yellow),
                );
              } else if (state is TvSeriesSearchError) {
                return Center(child: Text(state.message));
              } else if (state is TvSeriesSearchSuccess) {
                var tvSeries = state.response.results;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tvSeries.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: size.height * 0.03),
                  itemBuilder: (context, index) {
                    final tvSeriesItem = tvSeries[index];
                    return InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.details,
                          arguments: {
                            'id': tvSeriesItem.id,
                            'isMovie': false,
                            'isArabic': isArabic,
                          },
                        );
                      },
                      child: TvSeriesItemWidget(
                        posterPath: tvSeriesItem.posterPath,
                        name: tvSeriesItem.name,
                        voteAverage: tvSeriesItem.voteAverage,
                        firstAirDate: tvSeriesItem.firstAirDate.length > 3
                            ? tvSeriesItem.firstAirDate.substring(0, 4)
                            : tvSeriesItem.firstAirDate,
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
