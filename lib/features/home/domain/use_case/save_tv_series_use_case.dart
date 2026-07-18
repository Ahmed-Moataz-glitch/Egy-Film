import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class SaveTvSeriesUseCase {
    final HomeRepo _homeRepo;
  
    SaveTvSeriesUseCase(this._homeRepo);
  
    Future<bool> call(TvSeriesModel tvSeries) {
      return _homeRepo.saveTvSeries(tvSeries);
    }
}