import 'package:egy_film/core/utils/app_constants.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WatchListApi {
  List<MovieModel> getSavedMovies() {
    var moviesBox = Hive.box<MovieModel>(AppConstants.moviesBox);
    return moviesBox.values.toList();
  }

  List<TvSeriesModel> getSavedTvSeries() {
    var tvSeriesBox = Hive.box<TvSeriesModel>(AppConstants.tvSeriesBox);
    return tvSeriesBox.values.toList();
  }
}
