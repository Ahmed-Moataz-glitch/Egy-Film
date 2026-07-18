import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/domain/entities/movies_search_response_entity.dart';
import 'package:egy_film/features/search/domain/entities/tv_series_search_response_entity.dart';
import 'package:egy_film/features/search/domain/use_case/get_movies_search_use_case.dart';
import 'package:egy_film/features/search/domain/use_case/get_tv_series_search_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetMoviesSearchUseCase getMoviesSearchUseCase;
  final GetTvSeriesSearchUseCase getTvSeriesSearchUseCase;
  SearchCubit({
    required this.getMoviesSearchUseCase, 
    required this.getTvSeriesSearchUseCase
    }): super(SearchInitial());

  Future<void> getMoviesSearch({required String searchText, required bool isArabic}) async {
    emit(MoviesSearchLoading());
    try {
      final result = await getMoviesSearchUseCase.call(searchText: searchText, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<MoviesSearchResponseEntity>():
          emit(MoviesSearchSuccess(result.data!));
        case ApiError<MoviesSearchResponseEntity>():
          emit(MoviesSearchError(result.message));
      }
    } catch (e) {
      emit(MoviesSearchError(e.toString()));
    }
  }

  Future<void> getTvSeriesSearch({required String searchText, required bool isArabic}) async {
    emit(TvSeriesSearchLoading());
    try {
      final result = await getTvSeriesSearchUseCase.call(searchText: searchText, isArabic: isArabic);
      switch (result) {
        case ApiSuccess<TvSeriesSearchResponseEntity>():
          emit(
            TvSeriesSearchSuccess(result.data!),
          );
        case ApiError<TvSeriesSearchResponseEntity>():
          emit(TvSeriesSearchError(result.message));
      }
    } catch (e) {
      emit(TvSeriesSearchError(e.toString()));
    }
  }
}
