import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/top_rated_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetTopRatedMoviesUseCase {
  final HomeRepo homeRepo;
  GetTopRatedMoviesUseCase(this.homeRepo);

  Future<ApiResult<TopRatedMoviesResponseEntity>> call(bool isArabic) {
    return homeRepo.getTopRatedMovies(isArabic);
  }
}