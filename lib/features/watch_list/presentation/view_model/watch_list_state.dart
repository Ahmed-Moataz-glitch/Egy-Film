part of 'watch_list_cubit.dart';

sealed class WatchListState {}

final class WatchListInitial extends WatchListState {}

// final class MoviesWatchListLoading extends WatchListState {}

final class WatchListMoviesSuccess extends WatchListState {
  final List<MovieModel> savedMovies;
  WatchListMoviesSuccess(this.savedMovies);
}

// final class TvSeriesWatchListLoading extends WatchListState {}

final class WatchListTvSeriesSuccess extends WatchListState {
  final List<TvSeriesModel> savedTvSeries;
  WatchListTvSeriesSuccess(this.savedTvSeries);
}