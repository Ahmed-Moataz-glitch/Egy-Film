import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/watch_list/domain/repo/repo/watch_list_repo.dart';

class GetSavedMoviesUseCase {
  final WatchListRepo watchListRepo;
  GetSavedMoviesUseCase(this.watchListRepo);

  List<MovieModel> call() {
    return watchListRepo.getSavedMovies();
  }
}