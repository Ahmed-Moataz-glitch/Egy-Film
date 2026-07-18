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

abstract class HomeRepo {
  Future<ApiResult<TopRatedMoviesResponseEntity>> getTopRatedMovies(
    bool isArabic,
  );

  Future<ApiResult<PopularMoviesResponseEntity>> getPopularMovies(
    bool isArabic,
  );

  Future<ApiResult<NowPlayingMoviesResponseEntity>> getNowPlayingMovies(
    bool isArabic,
  );

  Future<ApiResult<MovieDetailsResponseEntity>> getMovieDetails({
    required int movieId,
    required bool isArabic,
  });

  bool isMovieSaved(int movieId);

  Future<bool> saveMovie(MovieModel movie);

  bool isTvSeriesSaved(int tvSeriesId);

  Future<bool> saveTvSeries(TvSeriesModel tvSeries);

  Future<ApiResult<SimilarMoviesResponseEntity>> getSimilarMovies({
    required int movieId,
    required bool isArabic,
  });

  Future<ApiResult<MovieTrailersResponseEntity>> getMovieTrailers({
    required int movieId,
    required bool isArabic,
  });

  Future<ApiResult<TopRatedTvSeriesResponseEntity>> getTopRatedTvSeries(
    bool isArabic,
  );

  Future<ApiResult<PopularTvSeriesResponseEntity>> getPopularTvSeries(
    bool isArabic,
  );

  Future<ApiResult<AiringTodayTvSeriesResponseEntity>> getAiringTodayTvSeries(
    bool isArabic,
  );

  Future<ApiResult<TvSeriesDetailsResponseEntity>> getTvSeriesDetails({
    required int tvSeriesId,
    required bool isArabic,
  });

  Future<ApiResult<SimilarTvSeriesResponseEntity>> getSimilarTvSeries({
    required int tvSeriesId,
    required bool isArabic,
  });

  Future<ApiResult<TvSeriesTrailersResponseEntity>> getTvSeriesTrailers({
    required int tvSeriesId,
    required bool isArabic,
  });
}
