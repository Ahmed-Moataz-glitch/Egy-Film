import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/domain/entities/tv_series_search_response_entity.dart';
import 'package:egy_film/features/search/domain/repo/repo/search_repo.dart';

class GetTvSeriesSearchUseCase {
  final SearchRepo _searchRepo;

  GetTvSeriesSearchUseCase(this._searchRepo);

  Future<ApiResult<TvSeriesSearchResponseEntity>> call({required String searchText, required bool isArabic}) {
    return _searchRepo.getTvSeriesSearch(searchText: searchText, isArabic: isArabic);
  }
}