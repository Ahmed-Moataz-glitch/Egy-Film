import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class IsMovieSavedUseCase {
    final HomeRepo _homeRepo;
  
    IsMovieSavedUseCase(this._homeRepo);
  
    bool call(int movieId) {
      return _homeRepo.isMovieSaved(movieId);
    }
}