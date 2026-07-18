import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/watch_list/data/api/watch_list_api.dart';
import 'package:egy_film/features/watch_list/domain/repo/data_source/watch_list_data_source.dart';

class WatchListDataSourceImpl extends WatchListDataSource {
  final WatchListApi _watchListApi;
  WatchListDataSourceImpl(this._watchListApi);
  
  @override
  List<MovieModel> getSavedMovies() {
    return _watchListApi.getSavedMovies();
  }

  @override
  List<TvSeriesModel> getSavedTvSeries() {
    return _watchListApi.getSavedTvSeries();
  }
}