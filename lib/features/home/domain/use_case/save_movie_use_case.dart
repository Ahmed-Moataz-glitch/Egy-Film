import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class SaveMovieUseCase {
    final HomeRepo _homeRepo;
  
    SaveMovieUseCase(this._homeRepo);
  
    Future<bool> call(MovieModel movie) {
      return _homeRepo.saveMovie(movie);
    }
}