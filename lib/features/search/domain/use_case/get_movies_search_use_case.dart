import 'package:egy_film/features/search/data/api/api_result.dart';
import 'package:egy_film/features/search/domain/entities/movies_search_response_entity.dart';
import 'package:egy_film/features/search/domain/repo/repo/search_repo.dart';

class GetMoviesSearchUseCase {
  final SearchRepo _searchRepo;

  GetMoviesSearchUseCase(this._searchRepo);

  Future<ApiResult<MoviesSearchResponseEntity>> call({required String searchText, required bool isArabic}) {
    return _searchRepo.getMoviesSearch(searchText: searchText, isArabic: isArabic);
  }
}