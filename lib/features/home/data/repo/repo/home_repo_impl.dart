import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/domain/entities/airing_today_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/movie_details_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/movie_trailers_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/now_playing_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/popular_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/popular_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/similar_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/similar_tv_series_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/top_rated_movies_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/top_rated_tv_series_response_dto.dart';
import 'package:egy_film/features/home/domain/entities/tv_series_details_response_entity.dart';
import 'package:egy_film/features/home/domain/entities/tv_series_trailers_response_entity.dart';
import 'package:egy_film/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:egy_film/features/home/domain/repo/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource _homeDataSource;
  HomeRepoImpl(this._homeDataSource);

  @override
  Future<ApiResult<NowPlayingMoviesResponseEntity>> getNowPlayingMovies(bool isArabic) {
    return _homeDataSource.getNowPlayingMovies(isArabic);
  }

  @override
  Future<ApiResult<PopularMoviesResponseEntity>> getPopularMovies(bool isArabic) {
    return _homeDataSource.getPopularMovies(isArabic);
  }

  @override
  Future<ApiResult<TopRatedMoviesResponseEntity>> getTopRatedMovies(bool isArabic) {
    return _homeDataSource.getTopRatedMovies(isArabic);
  }

  @override
  Future<ApiResult<MovieDetailsResponseEntity>> getMovieDetails({required int movieId, required bool isArabic}) {
    return _homeDataSource.getMovieDetails(movieId: movieId, isArabic: isArabic);
  }

  @override
  Future<ApiResult<SimilarMoviesResponseEntity>> getSimilarMovies({required int movieId, required bool isArabic}) {
    return _homeDataSource.getSimilarMovies(movieId: movieId, isArabic: isArabic);
  }

  @override
  Future<ApiResult<MovieTrailersResponseEntity>> getMovieTrailers({required int movieId, required bool isArabic}) {
    return _homeDataSource.getMovieTrailers(movieId: movieId, isArabic: isArabic);
  }

  @override
  Future<ApiResult<TopRatedTvSeriesResponseEntity>> getTopRatedTvSeries(bool isArabic) {
    return _homeDataSource.getTopRatedTvSeries(isArabic);
  }

  @override
  Future<ApiResult<PopularTvSeriesResponseEntity>> getPopularTvSeries(bool isArabic) {
    return _homeDataSource.getPopularTvSeries(isArabic);
  }

  @override
  Future<ApiResult<AiringTodayTvSeriesResponseEntity>> getAiringTodayTvSeries(bool isArabic) {
    return _homeDataSource.getAiringTodayTvSeries(isArabic);
  }

  @override
  Future<ApiResult<TvSeriesDetailsResponseEntity>> getTvSeriesDetails({required int tvSeriesId, required bool isArabic}) {
    return _homeDataSource.getTvSeriesDetails(tvSeriesId: tvSeriesId, isArabic: isArabic);
  }

  @override
  Future<ApiResult<SimilarTvSeriesResponseEntity>> getSimilarTvSeries({required int tvSeriesId, required bool isArabic}) {
    return _homeDataSource.getSimilarTvSeries(tvSeriesId: tvSeriesId, isArabic: isArabic);
  }

  @override
  Future<ApiResult<TvSeriesTrailersResponseEntity>> getTvSeriesTrailers({required int tvSeriesId, required bool isArabic}) {
    return _homeDataSource.getTvSeriesTrailers(tvSeriesId: tvSeriesId, isArabic: isArabic);
  }

  @override
  bool isMovieSaved(int movieId) {
    return _homeDataSource.isMovieSaved(movieId);
  }

  @override
  bool isTvSeriesSaved(int tvSeriesId) {
    return _homeDataSource.isTvSeriesSaved(tvSeriesId);
  }

  @override
  Future<bool> saveMovie(MovieModel movie) {
    return _homeDataSource.saveMovie(movie);
  }

  @override
  Future<bool> saveTvSeries(TvSeriesModel tvSeries) {
    return _homeDataSource.saveTvSeries(tvSeries);
  }
}

