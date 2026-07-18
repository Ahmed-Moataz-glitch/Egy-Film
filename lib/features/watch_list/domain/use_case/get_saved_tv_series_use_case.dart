import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/watch_list/domain/repo/repo/watch_list_repo.dart';

class GetSavedTvSeriesUseCase {
  final WatchListRepo watchListRepo;

  GetSavedTvSeriesUseCase(this.watchListRepo);

  List<TvSeriesModel> call() {
    return watchListRepo.getSavedTvSeries();
  }
}
