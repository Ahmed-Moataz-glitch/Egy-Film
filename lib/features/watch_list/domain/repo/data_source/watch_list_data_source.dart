import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';

abstract class WatchListDataSource {
  List<MovieModel> getSavedMovies();
  List<TvSeriesModel> getSavedTvSeries();
}