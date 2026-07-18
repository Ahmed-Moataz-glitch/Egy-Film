import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/data/api/search_api.dart';
import 'package:egy_film/features/search/data/model/movies_search_response_dto.dart';
import 'package:egy_film/features/search/data/model/tv_series_search_response_dto.dart';
import 'package:egy_film/features/search/domain/entities/movies_search_response_entity.dart';
import 'package:egy_film/features/search/domain/entities/tv_series_search_response_entity.dart';
import 'package:egy_film/features/search/domain/repo/data_source/search_data_source.dart';

class SearchDataSourceImpl extends SearchDataSource {
  final SearchApi _searchApi;
  SearchDataSourceImpl(this._searchApi);

  @override
  Future<ApiResult<MoviesSearchResponseEntity>> getMoviesSearch({required String searchText, required bool isArabic}) async {
    final result = await _searchApi.getMoviesSearch(searchText: searchText, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<MoviesSearchResponseDto>():
        return ApiSuccess<MoviesSearchResponseEntity>(result.data?.toEntity());
      case ApiError<MoviesSearchResponseDto>():
        return ApiError<MoviesSearchResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<TvSeriesSearchResponseEntity>> getTvSeriesSearch({required String searchText, required bool isArabic}) async {
    final result = await _searchApi.getTvSeriesSearch(searchText: searchText, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<TvSeriesSearchResponseDto>():
        return ApiSuccess<TvSeriesSearchResponseEntity>(result.data?.toEntity());
      case ApiError<TvSeriesSearchResponseDto>():
        return ApiError<TvSeriesSearchResponseEntity>(result.message);
    }
  }
}
