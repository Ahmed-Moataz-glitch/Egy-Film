import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/similar_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetSimilarMoviesUseCase {
    final HomeRepo _homeRepo;
  
    GetSimilarMoviesUseCase(this._homeRepo);
  
    Future<ApiResult<SimilarMoviesResponseEntity>> call({required int movieId, required bool isArabic}) {
      return _homeRepo.getSimilarMovies(movieId: movieId, isArabic: isArabic);
    }
}