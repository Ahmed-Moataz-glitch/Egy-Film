import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/movie_details_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetMovieDetailsUseCase {
    final HomeRepo _homeRepo;
  
    GetMovieDetailsUseCase(this._homeRepo);
  
    Future<ApiResult<MovieDetailsResponseEntity>> call({required int movieId, required bool isArabic}) {
      return _homeRepo.getMovieDetails(movieId: movieId, isArabic: isArabic);
    }
}