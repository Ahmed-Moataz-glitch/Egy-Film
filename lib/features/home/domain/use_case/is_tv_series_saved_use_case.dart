import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class IsTvSeriesSavedUseCase {
    final HomeRepo _homeRepo;
  
    IsTvSeriesSavedUseCase(this._homeRepo);
  
    bool call(int tvSeriesId) {
      return _homeRepo.isTvSeriesSaved(tvSeriesId);
    }
}