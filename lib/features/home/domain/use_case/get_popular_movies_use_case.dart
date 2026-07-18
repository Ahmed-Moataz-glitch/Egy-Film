import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/popular_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetPopularMoviesUseCase {
  final HomeRepo _homeRepo;
  GetPopularMoviesUseCase(this._homeRepo);

  Future<ApiResult<PopularMoviesResponseEntity>> call(bool isArabic) {
    return _homeRepo.getPopularMovies(isArabic);
  }
}