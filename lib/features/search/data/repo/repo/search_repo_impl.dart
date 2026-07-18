import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/domain/entities/movies_search_response_entity.dart';
import 'package:egy_film/features/search/domain/entities/tv_series_search_response_entity.dart';
import 'package:egy_film/features/search/domain/repo/data_source/search_data_source.dart';
import 'package:egy_film/features/search/domain/repo/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final SearchDataSource _searchDataSource;
  SearchRepoImpl(this._searchDataSource);

  @override
  Future<ApiResult<MoviesSearchResponseEntity>> getMoviesSearch({required String searchText, required bool isArabic}) {
    return _searchDataSource.getMoviesSearch(searchText: searchText, isArabic: isArabic);
  }

  @override
  Future<ApiResult<TvSeriesSearchResponseEntity>> getTvSeriesSearch({required String searchText, required bool isArabic}) {
    return _searchDataSource.getTvSeriesSearch(searchText: searchText, isArabic: isArabic);
  }
}
