import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/domain/entities/now_playing_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class GetNowPlayingMoviesUseCase {
  final HomeRepo _homeRepo;
  GetNowPlayingMoviesUseCase(this._homeRepo);

  Future<ApiResult<NowPlayingMoviesResponseEntity>> call(bool isArabic) {
    return _homeRepo.getNowPlayingMovies(isArabic);
  }
}