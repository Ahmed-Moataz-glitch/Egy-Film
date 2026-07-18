import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/watch_list/domain/repo/data_source/watch_list_data_source.dart';
import 'package:egy_film/features/watch_list/domain/repo/repo/watch_list_repo.dart';

class WatchListRepoImpl extends WatchListRepo {
  final WatchListDataSource _watchListDataSource;
  WatchListRepoImpl(this._watchListDataSource);

  @override
  List<MovieModel> getSavedMovies() {
    return _watchListDataSource.getSavedMovies();
  }

  @override
  List<TvSeriesModel> getSavedTvSeries() {
    return _watchListDataSource.getSavedTvSeries();
  }
}