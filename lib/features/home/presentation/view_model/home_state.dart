part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class TopRatedMoviesLoading extends HomeState {}

final class PopularMoviesLoading extends HomeState {}

final class NowPlayingMoviesLoading extends HomeState {}

final class MovieDetailsLoading extends HomeState {}

final class SimilarMoviesLoading extends HomeState {}

final class MovieTrailersLoading extends HomeState {}

final class TopRatedTvSeriesLoading extends HomeState {}

final class PopularTvSeriesLoading extends HomeState {}

final class AiringTodayTvSeriesLoading extends HomeState {}

final class TvSeriesDetailsLoading extends HomeState {}

final class SimilarTvSeriesLoading extends HomeState {}

final class TvSeriesTrailersLoading extends HomeState {}

final class TopRatedMoviesSuccess extends HomeState {
  final TopRatedMoviesResponseEntity response;
  TopRatedMoviesSuccess(this.response);
}

final class PopularMoviesSuccess extends HomeState {
  final PopularMoviesResponseEntity response;
  PopularMoviesSuccess(this.response);
}

final class NowPlayingMoviesSuccess extends HomeState {
  final NowPlayingMoviesResponseEntity response;
  NowPlayingMoviesSuccess(this.response);
}

final class MovieDetailsSuccess extends HomeState {
  final MovieDetailsResponseEntity response;
  MovieDetailsSuccess(this.response);
}

final class SavingMovieSuccess extends HomeState {
  final List<MovieModel> savedMovies;
  SavingMovieSuccess(this.savedMovies);
}

final class SimilarMoviesSuccess extends HomeState {
  final SimilarMoviesResponseEntity response;
  SimilarMoviesSuccess(this.response);
}

final class MovieTrailersSuccess extends HomeState {
  final MovieTrailersResponseEntity response;
  MovieTrailersSuccess(this.response);
}

final class TopRatedTvSeriesSuccess extends HomeState {
  final TopRatedTvSeriesResponseEntity response;
  TopRatedTvSeriesSuccess(this.response);
}

final class PopularTvSeriesSuccess extends HomeState {
  final PopularTvSeriesResponseEntity response;
  PopularTvSeriesSuccess(this.response);
}

final class AiringTodayTvSeriesSuccess extends HomeState {
  final AiringTodayTvSeriesResponseEntity response;
  AiringTodayTvSeriesSuccess(this.response);
}

final class TvSeriesDetailsSuccess extends HomeState {
  final TvSeriesDetailsResponseEntity response;
  TvSeriesDetailsSuccess(this.response);
}

final class SavingTvSeriesSuccess extends HomeState {
  final List<TvSeriesModel> savedTvSeries;
  SavingTvSeriesSuccess(this.savedTvSeries);
}

final class SimilarTvSeriesSuccess extends HomeState {
  final SimilarTvSeriesResponseEntity response;
  SimilarTvSeriesSuccess(this.response);
}

final class TvSeriesTrailersSuccess extends HomeState {
  final TvSeriesTrailersResponseEntity response;
  TvSeriesTrailersSuccess(this.response);
}

final class TopRatedMoviesError extends HomeState {
  final String message;
  TopRatedMoviesError(this.message);
}

final class PopularMoviesError extends HomeState {
  final String message;
  PopularMoviesError(this.message);
}

final class NowPlayingMoviesError extends HomeState {
  final String message;
  NowPlayingMoviesError(this.message);
}

final class MovieDetailsError extends HomeState {
  final String message;
  MovieDetailsError(this.message);
}

final class SimilarMoviesError extends HomeState {
  final String message;
  SimilarMoviesError(this.message);
}

final class MovieTrailersError extends HomeState {
  final String message;
  MovieTrailersError(this.message);
}

final class TopRatedTvSeriesError extends HomeState {
  final String message;
  TopRatedTvSeriesError(this.message);
}

final class PopularTvSeriesError extends HomeState {
  final String message;
  PopularTvSeriesError(this.message);
}

final class AiringTodayTvSeriesError extends HomeState {
  final String message;
  AiringTodayTvSeriesError(this.message);
}

final class TvSeriesDetailsError extends HomeState {
  final String message;
  TvSeriesDetailsError(this.message);
}

final class SimilarTvSeriesError extends HomeState {
  final String message;
  SimilarTvSeriesError(this.message);
}

final class TvSeriesTrailersError extends HomeState {
  final String message;
  TvSeriesTrailersError(this.message);
}
