import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/domain/entities/movies_search_response_entity.dart';
import 'package:egy_film/features/search/domain/entities/tv_series_search_response_entity.dart';

abstract class SearchDataSource {
  Future<ApiResult<MoviesSearchResponseEntity>> getMoviesSearch({
    required String searchText,
    required bool isArabic,
  });

  Future<ApiResult<TvSeriesSearchResponseEntity>> getTvSeriesSearch({
    required String searchText,
    required bool isArabic,
  });
}
