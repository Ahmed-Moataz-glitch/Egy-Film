import 'package:egy_film/features/home/data/api/api_result.dart';
import 'package:egy_film/features/home/data/api/home_api.dart';
import 'package:egy_film/features/home/data/model/airing_today_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/movie_details_reponse_dto.dart';
import 'package:egy_film/features/home/data/model/movie_model.dart';
import 'package:egy_film/features/home/data/model/movie_trailers_response_dto.dart';
import 'package:egy_film/features/home/data/model/now_playing_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/popular_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/popular_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/similar_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/similar_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/top_rated_movies_response_dto.dart';
import 'package:egy_film/features/home/data/model/top_rated_tv_series_response_dto.dart';
import 'package:egy_film/features/home/data/model/tv_series_details_response_dto.dart';
import 'package:egy_film/features/home/data/model/tv_series_model.dart';
import 'package:egy_film/features/home/data/model/tv_series_trailers_response_dto.dart';
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

class HomeDataSourceImpl extends HomeDataSource {
  final HomeApi _homeApi;
  HomeDataSourceImpl(this._homeApi);

  @override
  Future<ApiResult<AiringTodayTvSeriesResponseEntity>> getAiringTodayTvSeries(bool isArabic) async {
    final result = await _homeApi.getAiringTodayTvSeries(isArabic);
    switch (result) {
      case ApiSuccess<AiringTodayTvSeriesResponseDto>():
        return ApiSuccess<AiringTodayTvSeriesResponseEntity>(result.data?.toEntity());
      case ApiError<AiringTodayTvSeriesResponseDto>():
        return ApiError<AiringTodayTvSeriesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<MovieDetailsResponseEntity>> getMovieDetails({required int movieId, required bool isArabic}) async {
    final result = await _homeApi.getMovieDetails(movieId: movieId, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<MovieDetailsResponseDto>():
        return ApiSuccess<MovieDetailsResponseEntity>(result.data?.toEntity());
      case ApiError<MovieDetailsResponseDto>():
        return ApiError<MovieDetailsResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<MovieTrailersResponseEntity>> getMovieTrailers({required int movieId, required bool isArabic}) async {
    final result = await _homeApi.getMovieTrailers(movieId: movieId, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<MovieTrailersResponseDto>():
        return ApiSuccess<MovieTrailersResponseEntity>(result.data?.toEntity());
      case ApiError<MovieTrailersResponseDto>():
        return ApiError<MovieTrailersResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<NowPlayingMoviesResponseEntity>> getNowPlayingMovies(bool isArabic) async {
    final result = await _homeApi.getNowPlayingMovies(isArabic);
    switch (result) {
      case ApiSuccess<NowPlayingMoviesResponseDto>():
        return ApiSuccess<NowPlayingMoviesResponseEntity>(result.data?.toEntity());
      case ApiError<NowPlayingMoviesResponseDto>():
        return ApiError<NowPlayingMoviesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<PopularMoviesResponseEntity>> getPopularMovies(bool isArabic) async {
    final result = await _homeApi.getPopularMovies(isArabic);
    switch (result) {
      case ApiSuccess<PopularMoviesResponseDto>():
        return ApiSuccess<PopularMoviesResponseEntity>(result.data?.toEntity());
      case ApiError<PopularMoviesResponseDto>():
        return ApiError<PopularMoviesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<PopularTvSeriesResponseEntity>> getPopularTvSeries(bool isArabic) async {
    final result = await _homeApi.getPopularTvSeries(isArabic);
    switch (result) {
      case ApiSuccess<PopularTvSeriesResponseDto>():
        return ApiSuccess<PopularTvSeriesResponseEntity>(result.data?.toEntity());
      case ApiError<PopularTvSeriesResponseDto>():
        return ApiError<PopularTvSeriesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<SimilarMoviesResponseEntity>> getSimilarMovies({required int movieId, required bool isArabic}) async {
    final result = await _homeApi.getSimilarMovies(movieId: movieId, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<SimilarMoviesResponseDto>():
        return ApiSuccess<SimilarMoviesResponseEntity>(result.data?.toEntity());
      case ApiError<SimilarMoviesResponseDto>():
        return ApiError<SimilarMoviesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<SimilarTvSeriesResponseEntity>> getSimilarTvSeries({required int tvSeriesId, required bool isArabic}) async {
    final result = await _homeApi.getSimilarTvSeries(tvSeriesId: tvSeriesId, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<SimilarTvSeriesResponseDto>():
        return ApiSuccess<SimilarTvSeriesResponseEntity>(result.data?.toEntity());
      case ApiError<SimilarTvSeriesResponseDto>():
        return ApiError<SimilarTvSeriesResponseEntity>(result.message);
    }
  }
  @override
  Future<ApiResult<TopRatedMoviesResponseEntity>> getTopRatedMovies(bool isArabic) async {
    final result = await _homeApi.getTopRatedMovies(isArabic);
    switch (result) {
      case ApiSuccess<TopRatedMoviesResponseDto>():
        return ApiSuccess<TopRatedMoviesResponseEntity>(result.data?.toEntity());
      case ApiError<TopRatedMoviesResponseDto>():
        return ApiError<TopRatedMoviesResponseEntity>(result.message);
    }
  }

  @override
  Future<ApiResult<TopRatedTvSeriesResponseEntity>> getTopRatedTvSeries(bool isArabic) async {
    final result = await _homeApi.getTopRatedTvSeries(isArabic);
    switch (result) {
      case ApiSuccess<TopRatedTvSeriesResponseDto>():
        return ApiSuccess<TopRatedTvSeriesResponseEntity>(result.data?.toEntity());
      case ApiError<TopRatedTvSeriesResponseDto>():
        return ApiError<TopRatedTvSeriesResponseEntity>(result.message);
    }
  }
  @override
  Future<ApiResult<TvSeriesDetailsResponseEntity>> getTvSeriesDetails({required int tvSeriesId, required bool isArabic}) async {
    final result = await _homeApi.getTvSeriesDetails(tvSeriesId: tvSeriesId, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<TvSeriesDetailsResponseDto>():
        return ApiSuccess<TvSeriesDetailsResponseEntity>(result.data?.toEntity());
      case ApiError<TvSeriesDetailsResponseDto>():
        return ApiError<TvSeriesDetailsResponseEntity>(result.message);
    }
  }
  @override
  Future<ApiResult<TvSeriesTrailersResponseEntity>> getTvSeriesTrailers({required int tvSeriesId, required bool isArabic}) async {
    final result = await _homeApi.getTvSeriesTrailers(tvSeriesId: tvSeriesId, isArabic: isArabic);
    switch (result) {
      case ApiSuccess<TvSeriesTrailersResponseDto>():
        return ApiSuccess<TvSeriesTrailersResponseEntity>(result.data?.toEntity());
      case ApiError<TvSeriesTrailersResponseDto>():
        return ApiError<TvSeriesTrailersResponseEntity>(result.message);
    }
  }

  @override
  bool isMovieSaved(int movieId) {
    return _homeApi.isMovieSaved(movieId);
  }

  @override
  bool isTvSeriesSaved(int tvSeriesId) {
    return _homeApi.isTvSeriesSaved(tvSeriesId);
  }

  @override
  Future<bool> saveMovie(MovieModel movie) {
    return _homeApi.saveMovie(movie);
  }

  @override
  Future<bool> saveTvSeries(TvSeriesModel tvSeries) {
    return _homeApi.saveTvSeries(tvSeries);
  }

}
