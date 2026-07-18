part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class MoviesSearchLoading extends SearchState {}

final class TvSeriesSearchLoading extends SearchState {}

final class MoviesSearchSuccess extends SearchState {
  final MoviesSearchResponseEntity response;
  MoviesSearchSuccess(this.response);
}

final class TvSeriesSearchSuccess extends SearchState {
  final TvSeriesSearchResponseEntity response;
  TvSeriesSearchSuccess(this.response);
}

final class MoviesSearchError extends SearchState {
  final String message;
  MoviesSearchError(this.message);
}

final class TvSeriesSearchError extends SearchState {
  final String message;
  TvSeriesSearchError(this.message);
}
