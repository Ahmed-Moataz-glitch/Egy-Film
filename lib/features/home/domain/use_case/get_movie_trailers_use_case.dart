import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/movie_trailers_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetMovieTrailersUseCase {
    final HomeRepo _homeRepo;
  
    GetMovieTrailersUseCase(this._homeRepo);
  
    Future<ApiResult<MovieTrailersResponseEntity>> call({required int movieId, required bool isArabic}) {
      return _homeRepo.getMovieTrailers(movieId: movieId, isArabic: isArabic);
    }
}